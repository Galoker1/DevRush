//
//  ContentView.swift
//  Converter
//
//  Created by Егор  Хлямов on 11.02.2024.
//

import SwiftUI

enum lengthType {
  case miles
  case kilometers
  case meters
  case feet
  case yards
  
  func toMiles(value: Double) -> Double {
    switch self {
    case .miles:
      return value
    case .kilometers:
      return value / 1.60934
    case .meters:
      return value / 1.60934 / 1000
    case .feet:
      return value / 5280
    case .yards:
      return value / 1760
    }
  }
  
  func toResultValue(value: Double) -> Double {
    switch self {
    case .miles:
      return value
    case .kilometers:
      return value * 1.60934
    case .meters:
      return value * 1.60934 * 1000
    case .feet:
      return value * 5280
    case .yards:
      return value * 1760
    }
  }
}
struct ContentView: View {
  @State var selectedInType: lengthType = .miles
  @State var selectedOutType: lengthType = .miles
  @State var inValue: String = ""
  @State var outValue: String = ""
  var body: some View {
    VStack {
      Picker("", selection: $selectedInType) {
        Text("miles").tag(lengthType.miles)
        Text("kilometers").tag(lengthType.kilometers)
        Text("meters").tag(lengthType.meters)
        Text("feet").tag(lengthType.feet)
        Text("yards").tag(lengthType.yards)
      }
      .pickerStyle(.segmented)
      .onChange(of: selectedInType) { newValue in
        updateResult()
      }
      
      TextField("", text: $inValue)
        .padding()
        .background(
          Color.teal
            .cornerRadius(10)
        )
        .keyboardType(.decimalPad)
        .onChange(of: inValue) { newValue in
          updateResult()
        }
      
      Picker("", selection: $selectedOutType) {
        Text("miles").tag(lengthType.miles)
        Text("kilometers").tag(lengthType.kilometers)
        Text("meters").tag(lengthType.meters)
        Text("feet").tag(lengthType.feet)
        Text("yards").tag(lengthType.yards)
      }
      .pickerStyle(.segmented)
      .onChange(of: selectedOutType) { newValue in
        updateResult()
      }
    }
    .padding()
    Text(outValue)
  }
  func updateResult() {
    if let inDouble = Double(inValue) {
      let milesValue = selectedInType.toMiles(value: inDouble)
      let outTypeValue = selectedOutType.toResultValue(value: milesValue)
      outValue = String(outTypeValue)
    }
  }
}
#Preview {
  ContentView()
}
