//
//  ContentView.swift
//  Atelier 5 IOS
//
//  Created by user228865 on 11/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var total = 0
    @State var taxes = false
    @State var nbPerso = 1
    @State var Tip = 0
    
    var body: some View {
        VStack {
            TextField("Total", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Taxes")/*@END_MENU_TOKEN@*/
            }
            TextField(/*@START_MENU_TOKEN@*/"Nombre de Personne"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            TextField(/*@START_MENU_TOKEN@*/"Tip"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            Button(/*@START_MENU_TOKEN@*/"PAYER"/*@END_MENU_TOKEN@*/) {
               
            }
            Label(/*@START_MENU_TOKEN@*/"PPP : "/*@END_MENU_TOKEN@*/, systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

