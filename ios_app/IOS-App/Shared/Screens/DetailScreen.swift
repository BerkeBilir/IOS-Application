//
//  DetailScreen.swift
//  deneme (iOS)
//
//  Created by BERKE on 12.01.2022.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var DetailZoomShow = false
    @State var DetailZoomShowOpen = true
    
    var body: some View {
        ZStack{
            Color("HomePageColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                    Button(action: {
                        if DetailZoomShowOpen {
                            DetailZoomShow.toggle()
                        }
                    }, label: {
                        DetailZoomScreen()
                            .fullScreenCover(isPresented: $DetailZoomShow, content: {
                                DetailTappedScreen()
                            })
                    })
                    .frame(height: 300)
                
                DescriptionView()
                    .offset(y: -42)
            }
            .edgesIgnoringSafeArea(.top)
            HStack{
                Text("$199")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                Button(action: {}, label: {
                    Text("Add To Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(.white)
                        .cornerRadius(19)
                        .foregroundColor(Color("cartColor"))
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color("cartColor"))
            .cornerRadius(radius: 50, corners: .topLeft)
            .cornerRadius(radius: 50, corners: .topRight)
            .frame(maxHeight: .infinity, alignment: .bottom)
            VStack{
                HStack{
                    Spacer()
                    detailBackButton()
                }
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct DescriptionView: View {
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                Text("Luxury Turkish\nFlower")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                HStack (spacing: 4){
                    ForEach(0 ..< 5) { item in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    Text("(4.9)")
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .padding(.leading, 8)
                    Spacer()
                }
                Text("Description")
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                    .foregroundColor(.black)
                
                Text("Luxury Turkish Flower is a contemporary Flower based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical Flower.")
                    .lineSpacing(9)
                    .foregroundColor(.black)
                    .opacity(0.6)
                HStack (alignment: .top){
                    VStack (alignment: .leading) {
                        Text("size")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.bottom, 4)
                        Text("Height: 120 cm")
                            .foregroundColor(.black)
                            .opacity(0.6)
                        Text("Width: 80 cm")
                            .foregroundColor(.black)
                            .opacity(0.6)
                        Text("Diameter: 72 cm")
                            .foregroundColor(.black)
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack (alignment: .leading){
                        Text("Treatment")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        Text("Jati Wood, Canvas, \nAmazing Love")
                            .foregroundColor(.black)
                            .opacity(0.6)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical)
                
                HStack (alignment: .bottom){
                    VStack (alignment: .leading){
                        Text("Colors")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        HStack{
                            ColorDotView(color: .white)
                            ColorDotView(color: .yellow)
                            ColorDotView(color: .green)
                        }
                    }
                    Spacer()
                    VStack (alignment: .leading){
                        Text("Quantity")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .padding(.bottom, 1)
                        HStack{
                            Button(action:{}) {
                                Image(systemName: "minus")
                                    .padding(.all, 8)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 30, height: 30)
                            .background(.red)
                            .clipShape(Circle())
                            .foregroundColor(.red)
                            
                            Text("1")
                                .foregroundColor(.black)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 8)
                            
                            Button(action:{}) {
                                Image(systemName: "plus")
                                    .padding(.all, 8)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 30, height: 30)
                            .background(.green)
                            .clipShape(Circle())
                            .foregroundColor(.green)
                        }
                    }
                }
            }
            .padding()
            .padding(.top)
            .background(Color("HomePageColor"))
            .cornerRadius(40)
        }
    }
}

struct imageview: View {
    let image2: Image
    let size2: CGFloat
    let color: Color
    var body: some View {
        Button(action: {
        }, label: {
            HStack {
                image2
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350 * (size2/210))
                .cornerRadius(20)
            }
            .background(Color("ProductColor"))
        })
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct detailBackButton: View {
    @Environment(\.presentationMode) var presentationMode2
    var body: some View {
        VStack {
            Button(action: {}, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .frame(width: 5, height:5)
                    .padding()
                    .background(.white)
                    .opacity(0.8)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .onTapGesture {
                        presentationMode2.wrappedValue.dismiss()
                    }
            })
        }
    }
}
