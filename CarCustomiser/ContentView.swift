//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Pierre Buclez on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var airIntakePackage = false
    @State private var brakesPackage = false
    @State private var remainingFunds = 1000
    
    var exhaustPackageEnabled : Bool{
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        
    }
    
    var tiresPackageEnabled : Bool{
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
        
    }
    
    var airIntakePackageEnabled : Bool{
            if remainingFunds >= 600 {
                return true
            } else {
                return false
            }
        
    }
    
    var brakesPackageEnabled : Bool{
            if remainingFunds >= 500 {
                return true
            } else {
                return false
            }
    }

    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get : { self.exhaustPackage },
            set: {newValue in self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get : { self.tiresPackage },
            set: {newValue in self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        let airIntakePackageBinding = Binding<Bool> (
            get : { self.airIntakePackage },
            set: {newValue in self.airIntakePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 2
                    starterCars.cars[selectedCar].topSpeed += 2
                    remainingFunds -= 600
                } else {
                    starterCars.cars[selectedCar].acceleration -= 2
                    starterCars.cars[selectedCar].topSpeed -= 2
                    remainingFunds += 600
                }
            }
        )
        let brakesPackageBinding = Binding<Bool> (
            get : { self.brakesPackage },
            set: {newValue in self.brakesPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 1
                    remainingFunds += 500
                }
            }
        )
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                        .font(.title2)
                        .bold()
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                }
                Section {
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Air Intake Package (Cost: 600)", isOn: airIntakePackageBinding)
                        .disabled(!airIntakePackageEnabled)
                    Toggle("Brakes Package (Cost: 500)", isOn: brakesPackageBinding)
                        .disabled(!brakesPackageEnabled)
                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.green)
                .baselineOffset(10)
                .bold()
        }
    }
    func resetDisplay() {
        exhaustPackage = false
        tiresPackage = false
        airIntakePackage = false
        brakesPackage = false
        remainingFunds = 1000
        starterCars = StarterCars()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
