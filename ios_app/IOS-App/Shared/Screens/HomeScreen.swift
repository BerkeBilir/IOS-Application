//
//  HomeScreen.swift
//  deneme (iOS)
//
//  Created by BERKE on 12.01.2022.
//

import SwiftUI
import CodeScanner

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    @State var navbarShow = false
    @State var navbarShowOpen = true
    
    @State var profileShow = false
    @State var profileShowOpen = true
    
    @State var detailShow = false
    @State var detailShowOpen = true
    
    private let categories = ["All", "Table L.", "Kitchen L.", "Garden L.", "Long L.", "Short L."]
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("HomePageColor")
                    .edgesIgnoringSafeArea(.all)
                ScrollView (showsIndicators: false) {
                    VStack (alignment: .leading){
                        HStack{
                            Button(action: {
                                if navbarShowOpen {
                                    navbarShow.toggle()
                                }
                            }, label: {
                                MenuView()
                                    .fullScreenCover(isPresented: $navbarShow, content: {
                                        NavbarScreen()
                                    })
                            })
                            Spacer()
                            Button(action: {
                                if profileShowOpen {
                                    profileShow.toggle()
                                }
                            }, label: {
                                ProfileView()
                                    .fullScreenCover(isPresented: $profileShow, content: {
                                        ProfileScreen()
                                    })
                            })
                        }
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count) { i in
                                    CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        Text("Popular")
                            .foregroundColor(.brown)
                            .font(.custom("PlayfairDisplay-Bold", size: 28))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    Button(action: {
                                        if detailShowOpen {
                                            detailShow.toggle()
                                        }
                                    }, label: {
                                        ProductCardView(image: Image("vase-\(index + 1)"), size: 210)
                                            .fullScreenCover(isPresented: $detailShow, content: {
                                                DetailView()
                                            })
                                    })
                                        
                                    
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        Text("New")
                            .foregroundColor(.brown)
                            .font(.custom("PlayfairDisplay-Bold", size: 28))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("vase-\(index + 1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                    }
                }
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct MenuView: View {
    var body: some View {
        HStack{
            Image(systemName: "text.justify")
                .frame(width: 42, height: 42)
                .foregroundColor(.brown)
                .background(.white)
                .font(.title2)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        HStack{
            Image("profile-photo")
                .resizable()
                .frame(width: 42, height: 42)
                .clipShape(Circle())
                .scaledToFill()
                .shadow(color: .black.opacity(0.2), radius: 4, x: 4, y: 4)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 4, y: -4)
                .shadow(color: .black.opacity(0.2), radius: 4, x: -4, y: 4)
                .shadow(color: .black.opacity(0.2), radius: 4, x: -4, y: -4)
        }
        .padding()
    }
}

struct TagLineView: View {
    var body: some View {
        Text("The Best\n")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.brown)
        + Text("Lamps ")
            .font(.custom("PlayfairDisplay-Bold", size: 35))
            .foregroundColor(Color.brown)
        + Text("Are Here")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color.brown)
    }
}

struct SearchAndScanView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    @State private var search: String = ""
    
    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        HStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                    .foregroundColor(.brown)
                TextField("Search Lamps", text: $search)
            }
            .padding()
            .background(.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {
                self.isPresentingScanner = true
            }, label: {
                Image(systemName: "qrcode.viewfinder")
                    .frame(width: 50, height: 50)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(.brown)
                    .cornerRadius(10)
            })
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .brown: Color.gray.opacity(0.5) )
            if (isActive) {
                Color.brown
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 180 * (size/210))
                .cornerRadius(20)
            Text("Luxury Turkish Flower")
                .foregroundColor(.black)
                .font(.title3)
                .fontWeight(.bold)
            HStack (spacing: 2){
                ForEach(0 ..< 5) { item in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                Spacer()
                Text("$199")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color("ProductColor"))
        .cornerRadius(20)
    }
}
