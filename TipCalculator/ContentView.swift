//
//  ContentView.swift
//  TipCalculator
//
//  Created by Reghuram on 25/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount: String = ""
    @State private var tipPercentage: Double = 15
    
    var billDouble: Double {
        Double(billAmount) ?? 0
    }
    
    var tipAmount: Double {
        billDouble * (tipPercentage / 100)
    }
    
    var totalAmount: Double {
        billDouble + tipAmount
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20) {
                Text("Tip Calculator")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                VStack(alignment: .leading, spacing: 8) {
                    Text("BILL AMOUNT")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    HStack {
                        Text("$")
                            .foregroundStyle(.white)
                        TextField("0.00", text: $billAmount)
                            .keyboardType(.decimalPad)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5)))
                    Text("TextField with .keyboardType(.decimalPad)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("TIP PERCENTAGE")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Spacer()
                        Text("\(tipPercentage, specifier: "%.0f")%")
                                    .foregroundStyle(.blue)
                                    .fontWeight(.semibold)
                    }
                    Slider(value: $tipPercentage, in: 0...30, step: 1)
                        .tint(.blue)
                    HStack {
                        Text("0%")
                        Spacer()
                        Text("30%")
                    }
                    .font(.caption)
                    .foregroundStyle(.gray)
                    Text("Slider with range 0..30, step 1")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                
                Divider()
                    .background(Color.gray.opacity(0.5))
                
                VStack(spacing: 12) {
                    
                    HStack {
                        Text("Tip amount")
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Text(tipAmount.formatted(.currency(code: "SGD")))
                            .foregroundStyle(.white)
                    }
                    
                    HStack {
                        Text("Subtotal")
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text(billDouble.formatted(.currency(code: "SGD")))
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
                VStack(spacing: 8) {
                    
                    Text("TOTAL")
                        .font(.caption)
                        .foregroundStyle(.green)
                    
                    Text(totalAmount.formatted(.currency(code: "SGD")))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
