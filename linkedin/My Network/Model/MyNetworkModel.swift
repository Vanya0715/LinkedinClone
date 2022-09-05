//
//  MyNetworkModel.swift
//  linkedin
//
//  Created by Divyansh Dwivedi on 24/08/22.
//

import Foundation

struct MyNetworkModel {
    var id: Int
    var name: String
    var position: String
    var mutual: Int
    var image: String
}
var mockData: [MyNetworkModel] = [

    .init(id: 0, name: "Marry", position: "SDE at Paytm", mutual: 34, image: "00"),
    .init(id: 1, name: "Peter", position: "Assistant Manager", mutual: 45, image: "01"),
    .init(id: 2, name: "Jenny", position: "SDE at Ginger ", mutual: 67, image: "02"),
    .init(id: 3, name: "Sara", position: "open to work", mutual: 103, image: "03"),
    .init(id: 4, name: "Kia", position: "GET at HCL", mutual: 12, image: "04"),
    .init(id: 5, name: "Shristi", position: "Student", mutual: 78, image: "05"),
    .init(id: 6, name: "Rachel", position: "intern at iNeuron", mutual: 90, image: "00")
]
