//
//  HomeScreen.swift
//  testSwiftUi
//
//  Created by Amr Hassan on 14/02/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        HomeView()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView{
        ZStack {
            Color("Bg").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    AppBarView()
                    AppLineView().padding(.top)
                    SearchView().padding(.top)
                    CatagoriesScrollView()
                    ProdectsViews()
                    
                }
                .padding()
            }
            // MARK: - custom tab bar
            HStack {
                Spacer()
                TabBarButton(image: "Home") {}
                Spacer()
                TabBarButton(image: "shap") {}
                Spacer()
                TabBarButton(image: "User") {}
                Spacer()
                TabBarButton(image: "Home") {}
                Spacer()
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.3), radius: 8,x: 2,y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
    }
}

struct CatagorieView: View {
    var isActive: Bool
    var text: String
    var body: some View {
        VStack(spacing: 0){
            Text(text)
                .font(.system(size:16))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.6))
            if isActive {
                Color("Primary")
                    .frame(width: 15, height: 2,alignment: .leading)
                    .clipShape(Capsule())
                
            }
            
        }
        .padding(.trailing)
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button(action: {}){
                Image("menu").padding()
                    .background(Color.white).cornerRadius(10)
            }
            Spacer()
            Button(action: {}) {
                Image("Profile").resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10)
            }
        }
    }
}

struct AppLineView: View {
    var body: some View {
        Text("Find The \n Best ")
            .font(Font.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!") .font(Font.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
        
    }
}

struct SearchView: View {
    @State private var search : String = ""
    var body: some View {
        HStack {
            HStack{
                Image("Search")
                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 8))
                TextField("search" , text : $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            
            Image("menu")
                .padding()
                .background(Color.white)
                .cornerRadius(10)
        }
    }
}

struct CatagoriesScrollView: View {
    @State private var selectedIndex  = 0
    private var catagories = ["All","youssef","mohammed","esmail","elsf","vg","gfg"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< catagories.count) { item in
                    CatagorieView(isActive: item == selectedIndex, text: catagories[item]).onTapGesture {
                        selectedIndex = item
                    }
                }
            }.padding()
        }
    }
}

struct ProdectsViews : View{
    var body: some View {
        Text("Popular").font(.system(size: 24))
            .fontWeight(.bold)
            .padding(.top)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                ForEach(0 ..< 4) { index in
                    NavigationLink(destination: DetailsView(), label: {
                        ProdectsView(image: "chair_\(index + 1)", size: 210)
                    }).foregroundColor(Color.black)
                }.padding(.leading)
            }
        }
        
        Text("Best").font(.system(size: 24))
            .fontWeight(.bold)
            .padding(.top)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0 ..< 4) { index in
                    ProdectsView(image: "chair_\(index + 1)", size: 180)
                }.padding(.leading)
            }
        }
    }
}

    struct ProdectsView : View  {
        var image: String
        var size: CGFloat
        var body: some View {
            VStack{
                Image(image).resizable()
                    .frame(width: size, height: 200 * (size / 210))
                HStack(spacing: 2){
                    ForEach(0 ..< 5) { item in
                        Image("star")
                    }
                    Spacer()
                    Text("$1994")
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }
            .frame(width: size)
            .padding()
            .background(Color.white)
            .cornerRadius(20)
        }
    }
}

struct TabBarButton: View {
    var image: String
    var action : ()->Void
    var body: some View {
        Button(action: action) {
            Image("Home")
        }
        
    }
}
