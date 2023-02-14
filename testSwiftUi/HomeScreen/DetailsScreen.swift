//
//  DetailsScreen.swift
//  testSwiftUi
//
//  Created by Amr Hassan on 14/02/2023.
//

import SwiftUI

struct DetailsScreen: View {
    var body: some View {
        DetailsView()
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}
struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    DescriptionView()
                        .offset(y: -40)

                }
                
            }.edgesIgnoringSafeArea(.top)
            
            
            HStack {
                Text("1.999")
                Spacer()
                Button(action: {}) {
                    Text("Add to a Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .frame(maxHeight: .infinity,alignment: .bottom)
            
        }.edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackBarButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: CustomBackBarButton(action: {}))
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Luruxy Swedia \nChair")
                .font(.title)
                .fontWeight(.bold)
            HStack(spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Text("4.5")
                    .opacity(0.5)
                    .padding()
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical , 8)
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair.")
                .lineSpacing(8.0)
                .opacity(0.6)
            HStack(alignment: .top) {
                VStack(alignment: .leading){
                    Text("size").fontWeight(.semibold)
                        .padding(.bottom)
                    Text("Height : 274 cm").opacity(0.5)
                    Text("Wide : 12 cm").opacity(0.5)
                    Text("Diameter : 12 cm").opacity(0.5)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    Text("Jati Wood, Canvas, \n Amazing Love")
                        .opacity(0.6)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.padding(.vertical)
            
            HStack(alignment: .bottom){
                VStack{
                    Text("Treatment")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    HStack{
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                Spacer()
                VStack (alignment: .leading) {
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }.frame(width: 30, height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .foregroundColor(.black)
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal , 8)
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }.frame(width: 30, height: 30)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                            .foregroundColor(.black)
                    }
                }
                
               
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    var color: Color
    var body: some View {
        color.frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}


struct CustomBackBarButton: View {
    var action : ()-> Void
    var body: some View {
        Button (action: action ,label: {
            
            Image(systemName: "chevron.backward").padding(.all , 12)
                .background(Color.white)
                .cornerRadius(8)
                .foregroundColor(.black)
        })

    }
}
