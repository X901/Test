//
//  ContentView.swift
//  Test
//
//  Created by Basel Baragabah on 29/10/2023.
//

import SwiftUI

enum SheetActions: Identifiable {
    case firstSheet, secondSheet

    var id: Int {
        switch self {
        case .firstSheet:
            return 1
        case .secondSheet:
            return 2
        }
    }
}

struct ContentView: View {
    @State private var currentSheet: SheetActions?

    var body: some View {
        VStack {
            Button("Open First Sheet") {
                currentSheet = .firstSheet
            }
            .padding()
        }
        .sheet(item: $currentSheet, content: { item in
            switch item {
            case .firstSheet:
                FirstSheetView(currentSheet: $currentSheet)
            case .secondSheet:
                Text("Second Sheet")
            }
        })
    }
}

struct FirstSheetView: View {
    @Binding var currentSheet: SheetActions?

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView(currentSheet: $currentSheet)) {
                    Text("Navigate to Second View")
                }
                .padding()
            }
            .navigationBarTitle("First Sheet", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                currentSheet = nil
            }) {
                Text("Close")
            })
        }
    }
}

struct SecondView: View {
    @Binding var currentSheet: SheetActions?

    var body: some View {
        VStack {
            Button("Open Second Sheet") {
                currentSheet = .secondSheet
            }
            .padding()
        }
        .navigationBarTitle("Second View", displayMode: .inline)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

