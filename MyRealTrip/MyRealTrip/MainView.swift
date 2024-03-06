//
//  MainView.swift
//  MyRealTrip
//
//  Created by 비긴어브랜드 on 3/6/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.placeholder)
                .frame(height: 50)
                .overlay{
                    // TODO: - 검색바 클릭시 내비게이션메뉴, 검색, 프로필로 이동
                    HStack{
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Spacer()
                        Text("\"삿포로 패키지\"를 검색해보세요")
                            .foregroundStyle(.gray)
                        Spacer()
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding()
                    
                }
            // 스크롤 네비게이션
            ScrollView(.horizontal){
                HStack(spacing: 15){
                    //TODO: - 버튼들 클릭하면 각자 페이지 이동하기
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "mountain.2.fill")
                            Text("일본벚꽃특가")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "airplane")
                            Text("항공")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "house.fill")
                            Text("호텔-리조트")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "globe.americas.fill")
                            Text("투어-티켓")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "")
                            Text("여행자보험")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "mountain.2.fill")
                            Text("에어텔")
                        }
                    }
                    Button{
                        
                    }label: {
                        VStack{
                            Image(systemName: "mountain.2.fill")
                            Text("가족여행")
                        }
                    }
                }
                .foregroundStyle(.black)
                .font(.callout)
                //Hstack end
            }
            //HscrollView end
            
        }
        .padding(20)
    }
}

#Preview {
    MainView()
}
