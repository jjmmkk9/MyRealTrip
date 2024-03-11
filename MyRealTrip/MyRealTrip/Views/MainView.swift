//
//  MainView.swift
//  MyRealTrip
//
//  Created by 비긴어브랜드 on 3/6/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader{geometry in
            
            ScrollView{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hex: "#F5F4F5"))
                    .frame(height: 50)
                    .overlay{
                        // TODO: - 검색바 클릭시 내비게이션메뉴, 검색, 프로필로 이동
                        HStack{
                            Image(systemName: "line.3.horizontal")
                                .resizable()
                                .frame(width: 20, height: 15)
                            Spacer()
                            Text("\"삿포로 패키지\"를 검색해보세요")
                                .lineLimit(1)
                                .foregroundStyle(.gray)
                            Spacer()
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        .padding()
                    }
                    .padding([.horizontal, .bottom], 20)
                // 스크롤 네비게이션
                ScrollView(.horizontal){
                    HStack(spacing: 15){
                        //TODO: - 버튼들 클릭하면 각자 페이지 이동하기
                        Button{
                            Toast.shared.present(title: "위시리스트에서 제외되었어요", symbol: "bookmark.fill", bg: Color("lightGray"), timing: .short)
                        }label: {
                            VStack{
                                Image(systemName: "mountain.2.fill")
                                Text("일본벚꽃특가")
                            }
                        }
                        Button{
                            Toast.shared.present(title: "위시리스트에 추가되었어요", symbol: "bookmark.fill", tint: .white, bg: Color("skyblue"), timing: .short)
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
                    .padding(.horizontal, 20)
                    //Hstack end
                }
                .scrollIndicators(.hidden)
                //HscrollView end
                
                HStack{
                    Image(systemName: "clock.fill")
                    Text("오늘의 특별 혜택보기")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding(20)
                ScrollView(.horizontal){
                    //TODO: - 아이템 탭해서 스토리 구현하기
                    HStack{
                        Image("1huji")
                            .resizable()
                            .aspectRatio(3/4, contentMode: .fit)
                            .frame(width: 160)
                            .overlay(
                                OverlayText(text: "프라이빗 투어로 떠나는 도쿄 후지산 프라이빗 투어 도쿄 후지산 & 카와구치코")
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Image("3art")
                            .resizable()
                            .aspectRatio(3/4, contentMode: .fit)
                            .frame(width: 160)
                            .overlay(
                                OverlayText(text: "구글 선정 세계에서 가장 인기있는 미술관 TOP 5! 팀랩플래닛")
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Image("2sky")
                            .resizable()
                            .aspectRatio(3/4, contentMode: .fit)
                            .frame(width: 160)
                            .overlay(
                                OverlayText(text: "후지산과 도쿄 시내가 한 눈에 보이는 도쿄 스카이트리 전망대")
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        Image("4bburi")
                            .resizable()
                            .aspectRatio(3/4, contentMode: .fit)
                            .frame(width: 160)
                            .overlay(
                                OverlayText(text: "뿌리와 함께하는 수로왕릉 탐험 가이드와 무덤뷰 인생샷 코스 초특가 이벤트")
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }//Hstack end
                    .padding(.horizontal, 20)
                }//HscrollView end
                .scrollIndicators(.hidden)
                Spacer(minLength: 50)
                
                VStack(spacing: 20){ //카드 한개
                    Image("cardPreview1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width - 40, height: geometry.size.width - 40)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal, 10)
                        .overlay(
                            Text("더 알아보기")
                                .font(.subheadline)
                                .bold()
                                .padding(10)
                                .foregroundStyle(.white)
                                .background(.black.opacity(0.6))
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .offset(x: -35, y: -15)
                            
                            ,alignment: .bottomTrailing
                        )
                    VStack(alignment: .leading, spacing: 20){
                        Text("전문 가이드가 알려주는 흥미로운 역사 이야기와 함께")
                            .font(.title2)
                            .bold()
                        Text("무심하게 지나칠 뻔한 순간도 풍부하게 만들어줄 역사 이야기와 함께 여행을 한층 더 흥미롭게 만들어보세요!")
                            .font(.system(size: 14))
                        //TODO: - 상품 하나식 뿌리기
                        ProductRow(image: "cardPreview1", title:"도쿄 가이드북 작가의 아사쿠사 역사 워킹투어!", price: 55000)
                        ProductRow(image: "cardPreview2",title:"[도쿄/긴자] 어쩌고저쩌고 긴자짧은자 투어 여행", price: 75000)
                        ProductRow(image: "cardPreview3",title:"애니메이션에 나온 도쿄 배경지 고죠 사토루", price: 89000)
                        
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                
            }//container Scrollview end
        }//GeometryReader end
        
//        HStack{
//            Button{
//                
//            }label: {
//                VStack{
//                    Image(systemName: "house.fill")
//                    Text("홈")
//                }
//            }
////            .frame(width: )
//            Button{
//                
//            }label: {
//                VStack{
//                    Image(systemName: "house.fill")
//                    Text("저장됨")
//                }
//            }
//            Button{
//                
//            }label: {
//                VStack{
//                    Image(systemName: "house.fill")
//                    Text("내여행")
//                }
//            }
//            Button{
//                
//            }label: {
//                VStack{
//                    Image(systemName: "house.fill")
//                    Text("메시지")
//                }
//            }
//            Button{
//                
//            }label: {
//                VStack{
//                    Image(systemName: "house.fill")
//                    Text("커뮤니티")
//                }
//            }
//
//            
//        }
    }
}

struct OverlayText:View {
    var text : String
    var gradient = LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .center, endPoint: .bottom)
    var body: some View {
        ZStack(alignment: .bottom){
            gradient
            Text(text)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .font(.footnote)
                .lineLimit(2)
                .padding(5)
        }
    }
}

struct ProductRow : View {
    var image: String
    var title : String
    var price: Int
    var body: some View {
        HStack(alignment: .center, spacing: 10){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5){
                //제목
                Text(title)
                    .font(.system(size: 14))
                    .bold()
                    .lineLimit(1)
                //별점
                Text("⭐️ 5.0 (47)")
                    .font(.system(size: 14))
                
                HStack{
                    //TODO: - 무료취소이면 무료취소 표시
                    Text("무료취소")
                        .foregroundStyle(.white)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .padding(5)
                        .background(Color("freeCancel"))
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    Spacer()
                    
                    Text("\(price)원")
                        .fontWeight(.bold)
                        
                }
            }
        }
    }
}
#Preview {
    MainView()
}
