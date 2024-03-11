//
//  ContentView.swift
//  MyRealTrip
//
//  Created by 비긴어브랜드 on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            //toast append
//            Button{
//                Toast.shared.present(title: "", symbol: "")
//            } label: {
//                Text("Button")
//            }
            
            ZStack{
                switch selectedTab{
                case 0 :
                    MainView()
                    
                case 1 :
                    Text("1")
                    
                case 2 :
                    Text("2")
                    
                case 3 :
                    Text("3")
                    
                case 4 :
                    Text("4")
                    
                default:
                    Text("뭐누")
                }
            }
            Spacer()
            TabBar(selectedTab: $selectedTab)
                

        }
        
    }
}

struct TabBar:View {
    //TODO: - 위에 공간 뜨는거 없애기
    let tabBarImageNames = ["house.fill","bookmark.fill","bag.fill","paperplane.fill","person.3.fill"]
    let tabBarNames = ["홈", "저장됨","내여행","메시지","커뮤니티"]
    
    @Binding var selectedTab : Int
    
    var body: some View {
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color("lightGray"))
            HStack(alignment: .top){
                Spacer()
                ForEach(0..<tabBarNames.count) {num in
                    VStack(spacing: 8){
                        Image(systemName: tabBarImageNames[num])
                        Text(tabBarNames[num])
                            .font(.caption)
                    }
                    .foregroundStyle(selectedTab == num ? .black : .gray)
                    .onTapGesture {
                        selectedTab = num
                    }
                    Spacer()
                    
                }
            }
            .frame(height: 60)

    }
}

#Preview {
    RootView{
        ContentView()
    }
}
