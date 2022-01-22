//
//  DetailTappedScreen.swift
//  deneme (iOS)
//
//  Created by BERKE on 22.01.2022.
//

import SwiftUI

struct DetailTappedScreen: View {
    
    private var imagesNumber = 4
    @State private var imageIndex = 0
    
    func previous() {
        imageIndex = imageIndex > 0 ?
        imageIndex - 1 : imagesNumber - 1
    }
    
    func next() {
        imageIndex = imageIndex <
            imagesNumber ? imageIndex + 1 : 0
    }
    
    var controls: some View {
                HStack{
                    Button {
                        previous()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .background(.white)
                    }
                    .padding(.horizontal)
                    Spacer()
                    Button {
                        next()
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                            .background(.white)
                    }
                    .padding(.horizontal)
                }
    }
    
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                VStack{
                    TabView(selection: $imageIndex){
                        ForEach(0 ..< imagesNumber) { num in
                            Image("vase-\(num + 1)")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 300)
                                .overlay(Color.black.opacity(0))
                                .tag(num)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom)
                    .frame(width: proxy.size.width, height: proxy.size.height )
                    .background(.black)
                }
            }
            VStack{
                HStack{
                    Spacer()
                    backButton()
                        .foregroundColor(.black)
                        .opacity(0.6)
                }
                Spacer()
            }
        }
            
    }
}

struct DetailTappedScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailTappedScreen()
    }
}
