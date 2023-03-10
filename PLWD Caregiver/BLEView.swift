import SwiftUI
import CoreBluetooth

class BLEView: UIViewController, CBCentralManagerDelegate {
    // Name of the Bluetooth device to connect to
    let deviceName = "MyDevice"
    // Central manager for Bluetooth communication
    let centralManager = CBCentralManager()
    // Current state of the Bluetooth connection
    var connectionState = "Not connected"
    // The connected Bluetooth device
    var connectedDevice: CBPeripheral?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set up the central manager's delegate
        centralManager.delegate = self
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        // Check if Bluetooth is turned on
        guard central.state == .poweredOn else {
            print("Bluetooth is not available")
            return
        }
        // Start scanning for Bluetooth devices
        centralManager.scanForPeripherals(withServices: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // Check if the discovered device matches the target name
        if peripheral.name == deviceName {
            // Stop scanning for devices
            central.stopScan()
            // Connect to the device
            central.connect(peripheral, options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // Save the connected device and update the connection state
        connectedDevice = peripheral
        connectionState = "Connected"
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        // Reset the connected device and update the connection state
        connectedDevice = nil
        connectionState = "Disconnected"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Start scanning for Bluetooth devices when the view appears
        centralManager.scanForPeripherals(withServices: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Stop scanning for Bluetooth devices when the view disappears
        centralManager.stopScan()
        // Disconnect from the connected device (if any)
        if let connectedDevice = connectedDevice {
            centralManager.cancelPeripheralConnection(connectedDevice)
        }
    }
    
    // View that displays the connection state
    var body: some View {
        Text(connectionState)
    }
}
