import Foundation

let process = Process()
let pipe = Pipe()

process.executableURL = URL(fileURLWithPath: "/bin/sh")
process.arguments = ["-c", "ls -l"]
process.standardOutput = pipe

do {
    try process.run()
    process.waitUntilExit()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)
    
    print(output ?? "No output")
} catch {
    print("Failed to run command: \(error.localizedDescription)")
}
