//  ContentView.swift
//  Boot_TDD_TipCalculator
import SwiftUI

struct ContentView: View {
    @State private var total: String = ""
    @State private var tipPercent: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    let tipCalculator = TipCalculator()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                    .accessibilityIdentifier("totalTextField")
                
                Picker(selection: $tipPercent) {
                    Text("10%").tag(0.1)
                    Text("20%").tag(0.2)
                    Text("30%").tag(0.3)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.segmented)
                .padding(.top)
                .onChange(of: tipPercent) {
                    reset()
                }
                .accessibilityIdentifier( "tipPicker")
              
                Button("Calculate Tip") {
                    calculateTip()
                }
                .padding(.top, 32)
                .buttonStyle(.borderedProminent)
                .accessibilityIdentifier("calculateTipButton")
              
                Text(message)
                    .padding(.top, 64)
                
                Spacer()
                Text(tip ?? "")
                    .font(.system(size: 54))
                    .accessibilityLabel("tipText")
                Spacer()
            }
            .padding()
            .navigationTitle("Tip Calculator")
        }
    }
    
    // This is a VM architecture aproach that I don't like so much
    // MARK: - Logic
    func calculateTip() {
        reset()
        guard let totalAmount = Double(total) else {
            return
        }
        do {
            let result = try tipCalculator.calculate(total: totalAmount, tipPercent: tipPercent)
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            tip = formatter.string(from: NSNumber(value: result))
        } catch let error as TipCalculatorError {
            message = error.description
        } catch {
            message = error.localizedDescription
        }
    }
    
    func reset() {
        message = ""
        tip = ""
    }
    
}

#Preview {
    ContentView()
}
