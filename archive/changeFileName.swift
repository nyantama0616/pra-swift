import Foundation

let fileManager = FileManager.default

let filePath = "../input/hello.txt"
let fileURL = URL(fileURLWithPath: filePath)
let baseName = fileURL.deletingPathExtension().lastPathComponent

let name = "panda"
let copyURL = URL(fileURLWithPath: "../output/\(baseName)_\(name).txt")

do {
    try fileManager.copyItem(at: fileURL, to: copyURL)
} catch {
    print("Failed to copy file: \(error.localizedDescription)")
}
