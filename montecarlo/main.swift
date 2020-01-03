//
//  main.swift
//  montecarlo
//

import Foundation

let roulette = (0...36)

func spin() -> Bool {
    return roulette.randomElement()! >= 19
}

let n = 100
var budget = 100_000

let initialState = [1, 2, 3]

(1...100).forEach { _ in
    assert(budget > 0, "破産")
    (1...n).forEach { _ in
        var state = initialState
        while state.count >= 2 {
            if state.last! > 1000 {
                print(state)
            }
            let toBet = state.first! + state.last!

            if spin() {
                state.removeFirst()
                state.removeLast()
                budget += toBet
            } else {
                budget -= toBet
                state.append(toBet)
            }
        }
    }

    print("#################")
    print(budget)
}
