//
//  DadsApp.swift
//  DAds
//
//  Created by Teddy Falsen Hiis on 24/03/2023.
//

import SwiftUI

@main
struct DadsApp: App {
    @StateObject private var repository = Repository()
    @StateObject private var globals = Globals()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack(spacing: 0) {
                    MainView().environmentObject(repository)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            Image(systemName: "mustache").font(.system(size: 26))
                            Text("DAds").font(.custom("Comfortaa-Light", size: 46))
                        }.foregroundColor(globals.cardDark)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: FavoritesView().environmentObject(self.repository)) {
                            HStack {
                                Image(systemName: "heart").font(.system(size: 20))
                            }.foregroundColor(.red)
                        }
                    }
                }.padding(.top, 10)
            }.task { await repository.loadData() }
        }
    }
}
