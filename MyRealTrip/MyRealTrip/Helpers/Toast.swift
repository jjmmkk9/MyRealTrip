//
//  Toast.swift
//  MyRealTrip
//
//  Created by 비긴어브랜드 on 3/8/24.
//

import SwiftUI

//오버레이를 만들기 위한 루트뷰
//루트 뷰 컨트롤러가 상호 작용할 수 있게 하려면 오버레이 창을 모든 상호 작용을 루트 뷰 컨트롤러로 전달하는 pass-through window으로 변환해야 한다.
struct RootView<Content: View>:View {
    @ViewBuilder var content: Content
    
    @State private var overlayWindow: UIWindow?
    
    var body: some View {
        content
            .onAppear{
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, overlayWindow == nil{
                    //pass-through
                    let window = PassthroughWindow(windowScene: windowScene)
                    window.backgroundColor = .clear
                    //view controller
                    let rootController = UIHostingController(rootView: ToastGroup())
                    rootController.view.frame = windowScene.keyWindow?.frame ?? .zero
                    rootController.view.backgroundColor = .clear
                    
                    window.rootViewController = rootController
                    window.isHidden = false
                    window.isUserInteractionEnabled = true
                    //이 태그 값을 사용해서 원하는 윈도우씬에서 오버레이 윈도우를 추출할수 있다.
                    window.tag = 1009
                    
                    overlayWindow = window
                }
            }
    }
}

fileprivate class PassthroughWindow:UIWindow{
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else {return nil}
        
        return rootViewController?.view == view ? nil : view
    }
}

//observable 이기 때문에 싱글톤을 stateobject로 사용하여 overlay window root controller에서 uiupdat를 받을 수 있다.
class Toast: ObservableObject{
    static let shared = Toast()
    
//    @Published fileprivate var toasts : [ToastItem] = []
    @Published fileprivate var toast : ToastItem?
    
    func present(title: String, symbol : String?, tint: Color = .primary, bg: Color = .white, isUserInteractionEnabled: Bool = false, timing: ToastTime = .medium){
//        toasts.append(.init(title: title, symbol: symbol, tint: tint, bg: bg, isUserInteractionEnabled: isUserInteractionEnabled, timing: timing))
        toast = ToastItem(title: title, symbol: symbol, tint: tint, bg: bg, isUserInteractionEnabled: isUserInteractionEnabled, timing: timing)
    }
}

struct ToastItem : Identifiable{
    let id :UUID = .init()
    
    var title : String
    var symbol : String?
    var tint : Color
    var bg : Color
    var isUserInteractionEnabled :Bool
    
    //타이밍
    var timing : ToastTime = .medium
}
enum ToastTime: CGFloat{
    case short = 1.0
    case medium = 2.0
    case long = 3.0
}

fileprivate struct ToastGroup:View {
    @StateObject var model = Toast.shared
    var body: some View {
        GeometryReader{
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            ZStack{
//                ForEach(model.toasts) {
                if let item = model.toast {
                    ToastView(size: size, item: item)
                }
//                }
            }
            .padding(.bottom, safeArea.top == .zero ? 75 : 70)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
}

fileprivate struct ToastView: View {
    var size : CGSize
    var item: ToastItem
    @State private var animateIn : Bool = false
    @State private var animateOut : Bool = false
    
    var body: some View {
        HStack{
            if let symbol = item.symbol {
                Image(systemName: symbol)
                    .font(.title3)
                    .padding(.trailing, 10)
            }
            
            Text(item.title)
        }
        .foregroundStyle(item.tint)
        .padding(.horizontal, 20)
        .padding(.vertical, 13)
        .background(
            item.bg
                .shadow(.drop(color: .primary.opacity(0.06), radius: 5, x:5, y:5))
                .shadow(.drop(color: .primary.opacity(0.06), radius: 8, x:-5, y: -5)),
            in: .capsule
        )
        .contentShape(.capsule)
        .offset(y: animateIn ? 0 : 150)
        .offset(y: !animateOut ? 0 : 0)
        .task {
            guard !animateIn else {return}
            withAnimation(.snappy){
                animateIn = true
            }
            
            try? await Task.sleep(for: .seconds(item.timing.rawValue))
            
            removeToast()
        }
    }
    func removeToast(){
        guard !animateOut else {return}
        withAnimation(.snappy, completionCriteria: .logicallyComplete){
            animateOut = true
        }completion: {
            //duration 끝나면 리스트에서 아이템 지워
            
            removeToastItem()
        }
    }
    
    func removeToastItem(){
//        Toast.shared.toasts.removeAll(where: {$0.id == item.id})
        Toast.shared.toast = nil
    }
}



#Preview{
    RootView{
        ContentView()
    }
}
