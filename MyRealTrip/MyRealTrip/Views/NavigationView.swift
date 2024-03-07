//
//  NavigationView.swift
//  MyRealTrip
//
//  Created by 비긴어브랜드 on 3/7/24.
//

import SwiftUI

class Category {

    var name: String
    var id : Range<Int>
    
    init(name: String, id: Range<Int>) {
        self.name = name
        self.id = id
    }
}

struct NavigationView: View {
    
    @State private var selected : Int = 0

    
    var categories : [Category] = [Category(name: "항공", id: 0..<2), Category(name: "숙소", id: 2..<5), Category(name: "투어/티켓", id: 5..<9), Category(name: "패키지", id: 9..<12), Category(name: "여행편의", id: 12..<14), Category(name: "렌터카/교통", id: 14..<18), Category(name: "키즈", id: 18..<19), Category(name: "할인 이벤트", id: 19..<21)]
    var strings : [String] = ["항공권 검색","땡처리 특가","호텔/리조트 검색", "펜션/풀빌라 검색","한인민박" ,"투어/티켓", "돌아온 스키장 특가","일본 레스토랑 예약" ,"이피엘 공식티켓 특가" ,"패키지 검색" ,"해외골프" ,"가족여행" , "유심/이심" ,"여행자보험" ,"국내 렌터카" ,"해외 렌터카" ,"픽업샌딩" ,"내게 맞는 오사카 교통패스 찾기","키즈", "이벤트 모음","학생할인"]
    
    var views = [Text("항공권 검색"), Text("땡처리 특가"),  Text("호텔/리조트 검색"), Text("펜션/풀빌라 검색"), Text("한인민박"),Text("투어/티켓"),  Text("스키장 특가"),  Text("일본 레스토랑"),  Text("공식 특가"), Text("패키지 검색"),  Text("해외골프"),  Text("가족여행"),  Text("유심 이심"),  Text("여행자보험"),  Text("국내 렌터카"),  Text("해외 렌터카"), Text("픽업샌딩"),  Text("오사카 패스 찾기"),  Text("키즈"),Text("이벤트 모음"),  Text("학생할인")]
    
    var body: some View {
        NavigationStack(){
            HStack(spacing: 20){
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)

                Spacer()
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(20)
            
            HStack(alignment: .top){
                VStack(alignment: .leading, spacing: 0){
                    ForEach(categories.indices) { index in
                        Rectangle()
                            .frame(width: 150, height: 70)
                            .foregroundStyle(selected == index ? .white : Color("lightGray"))
                            .overlay(
                                Text(categories[index].name)
                                    .padding(.leading, 20)
                                ,alignment: .leading
                            )
                            .onTapGesture {
                                selected = index
                            }
                    }
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                .background(Color("lightGray"))
                
                VStack(alignment: .leading, spacing: 0){
                    ForEach(categories[selected].id, id:\.self){idx in
                        LinkRow(name: strings[idx], content: views[idx])
                    }
                    
                }
                .padding(.leading, 10)
                .padding(.trailing, 20)
            }

        }
    }
}

struct LinkRow<Content: View> :View {
    var name : String
    var content : Content
    
    var body: some View {
        NavigationLink {
            //여기 들어가는 페이지가 각각 다름
            content
        } label: {
            HStack{
                Text(name)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
            .frame(height: 70)
            .bold()
        }
    }
}

struct SampleDetail:View {
    var text : String
    var body: some View {
        Text("\(text) 페이지")
    }
}

#Preview {
    NavigationView()
}
