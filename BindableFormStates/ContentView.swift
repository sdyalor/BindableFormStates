//
//  ContentView.swift
//  BindableFormStates
//
//  Created by rkedlor on 5/25/20.
//  Copyright © 2020 rkedlor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var firstName = ""
  @State var lastName = ""
  @State var users = [String]()
  var body: some View {
    NavigationView {
      VStack {
        VStack{
          VStack {
            Group {
              TextField("First Name", text: $firstName).padding(12)
              TextField("Last Name", text: $lastName).padding(12)
            }.background(Color.white)
              .clipShape(RoundedRectangle(cornerRadius:5))
              .shadow(radius:5)
            Button(action: {
              self.users.append("\(self.firstName) \(self.lastName)")
              self.firstName = ""
              self.lastName = ""
            }){
              Group{
                Text("Create User").foregroundColor(.white).padding(12)
              }.background((firstName.count+lastName.count>0) ? Color.blue:Color.gray)
              .clipShape(RoundedRectangle(cornerRadius: 5))
              .shadow(radius: 5)
            }
            
          }.padding(10)
        }.background(Color.gray)
        List(users,id:\.self){
          Text($0)
        }
      }.navigationBarTitle("Credit Card Form")
        .navigationBarItems(leading: HStack {
         Text("First Name:")
          Text(firstName).foregroundColor(.red)
          Text("Last Name:")
          Text(lastName).foregroundColor(.red)
        })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
