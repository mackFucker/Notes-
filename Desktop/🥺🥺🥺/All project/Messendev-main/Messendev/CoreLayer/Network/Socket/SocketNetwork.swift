//
//  SocketNetwork.swift
//  Messendev
//
//  Created by Роман Анпилов on 03.02.2023.
//

import Foundation

let servicePort = "65431"

func socketConnect() {
    let socketFD = socket(AF_INET,
                          SOCK_STREAM,
                          IPPROTO_TCP)
    
    if socketFD == -1 {
        Log.error("Socket not created")
        return
    }
    
    var hints = addrinfo(ai_flags: AI_PASSIVE,
                         ai_family: AF_INET,
                         ai_socktype: SOCK_STREAM,
                         ai_protocol: 0,
                         ai_addrlen: 0,
                         ai_canonname: nil,
                         ai_addr: nil,
                         ai_next: nil)
    
    var servinfo: UnsafeMutablePointer<addrinfo>? = nil
    _ = getaddrinfo(nil,
                                     servicePort,
                                     &hints,
                                     &servinfo)
    
    connect(socketFD,
            servinfo!.pointee.ai_addr,
            socklen_t(servinfo!.pointee.ai_addrlen))
    
    let bytesPointer = UnsafeMutableRawPointer.allocate(byteCount: 4, alignment: 1)
    bytesPointer.storeBytes(of: 0x69736f73, as: UInt32.self)
    
    let newPointer = UnsafeMutableRawPointer.allocate(byteCount: 4, alignment: 1)
    
    send(socketFD, bytesPointer, 4, 0)
    recv(socketFD, newPointer, 4, 0)
    
    let bytes = UnsafeBufferPointer(start: newPointer.assumingMemoryBound(to: UInt8.self), count: 4)
    let i16array = Array(bytes)

    if let string = String(bytes: i16array, encoding: .utf8) {
        print(string)
    } else {
        print("not a valid UTF-8 sequence")
    }
}
