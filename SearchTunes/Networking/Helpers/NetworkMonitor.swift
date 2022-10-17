//
//  NetworkMonitor.swift
//  SearchTunes
//
//  Created by Thulani Mtetwa on 2022/10/16.
//
import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue(label: "Monitor")
    
    var isActive = true
    private(set) var isExpensive = false
    private(set) var isConstrained = false
    private(set) var connectionType = NWInterface.InterfaceType.other
    
    private init() {
        monitor = NWPathMonitor()
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = {[weak self] path in
            self?.isActive = path.status == .satisfied
            self?.isExpensive = path.isExpensive
            self?.isConstrained = path.isConstrained
            
            let connectionTypes: [NWInterface.InterfaceType] = [.cellular, .wifi, .wiredEthernet]
            self?.connectionType = connectionTypes.first(where: path.usesInterfaceType) ?? .other
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .connectivityStatus, object: nil)
            }
        }
        
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
