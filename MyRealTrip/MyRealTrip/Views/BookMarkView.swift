//
//  BookMarkView.swift
//  MyRealTrip
//
//  Created by 비긴어브랜드 on 3/7/24.
//

import SwiftUI
class Product: Identifiable {
    var id : UUID = UUID()
    var name : String = "샘플이다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ"
    var rate : Float = 4.8
    var review :  Int = 54
    var imageName : String = "Bookmarked1"
    var price : Int = 760000
    var city : String = "방콕"
    var type : String = "패키지"
    
    static let `default` = Product()
}

struct BookMarkView: View {
    @State private var selected : Int = 0
    var menus = ["전체", "투어/티켓", "숙소", "패키지"]
    
    var products = [Product(), Product(), Product()]
    var body: some View {
        VStack(alignment: .leading){
            Text("저장됨")
                .font(.title)
                .bold()
            //TODO: - 스와이프로 이동하기 구현~
            HStack(spacing: 15){
                ForEach(0..<menus.count){ num in
                    if selected == num{
                        Text(menus[num])
                            .font(.callout)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .padding(13)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                    }else{
                        Text(menus[num])
                            .font(.callout)
                            .foregroundStyle(.black)
                            .padding(13)
                            .onTapGesture {
                                selected = num
                            }
                    }
                }
                Spacer()
            }
            ScrollView{
                ForEach(products){product in
                    BookmarkedItem(product: product)
                }
                
            }
            
        }
        .padding(.horizontal, 20)
    }
}

struct BookmarkedItem:View {
    var product : Product
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 2 - 20, height: UIScreen.main.bounds.width / 2 - 20)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(product.name)
                .bold()
                .lineLimit(2)
            Text("⭐️\(product.rate) (\(product.review))")
            Text("\(product.price)원")
                .bold()
            Text("\(product.city) · \(product.type)")
                .font(.callout)
                .foregroundStyle(.gray)
            
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 20)
        
    }
}
#Preview {
    BookMarkView()
//    BookmarkedItem()
}
