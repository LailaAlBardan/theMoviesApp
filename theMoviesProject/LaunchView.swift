//
//  LaunchView.swift
//  theMoviesProject
//
//  Created by laila on 11/04/2023.
//

import SwiftUI
/* The launching view*/
struct LaunchView: View {
    @State private var approve = false
    
    var body: some View {
        NavigationView{
            VStack(spacing: 50){
                Text("Welcome to the movie App!")
                    .frame(width: 300, alignment: .center)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Button(action: { approve = true }) {
                    Text("Let's Start")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.blue, lineWidth: 5))
                }
                NavigationLink("", destination: ContentView(), isActive: $approve)
            }
        }
    }
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
