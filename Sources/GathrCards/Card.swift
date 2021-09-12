//
//  File.swift
//  
//
//  Created by Richard Robinson on 9/10/21.
//
import Foundation

public struct Card:Identifiable, Codable {
    public var id = UUID()
    public var title: String
    public var caption: String
    public var body: String
    public var image:String
    
    public enum CodingKeys: String, CodingKey {
        case title = "title"
        case caption = "caption"
        case body = "body"
        case image = "image"
    }
}

public let CardTestData =
    Card( title: "Lorem Ipsum ", caption: "Hello, world!", body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", image: "https://webdmg.com/img/bg-default.png")
