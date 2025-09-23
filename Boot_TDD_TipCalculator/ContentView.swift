//  ContentView.swift
//  Boot_TDD_TipCalculator
import SwiftUI

struct ContentView: View {
    @State private var total: String = ""
    @State private var tipPercent: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                
                Picker(selection: $tipPercent) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.segmented)
                .padding(.top)

                Button("Calculate Tip") {
                    
                }
                .padding(.top, 32)
                .buttonStyle(.borderedProminent)
              
                Text(message)
                    .padding(.top, 64)
                
                Spacer()
                Text(tip ?? "")
                    .font(.system(size: 54))
                Spacer()
            }
            .padding()
            .navigationTitle("Tip Calculator")
        }
    }
}

#Preview {
    ContentView()
}
