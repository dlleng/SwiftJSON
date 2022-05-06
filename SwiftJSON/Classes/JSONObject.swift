import Foundation


public enum JSONObject: CustomStringConvertible {
    case array([JSONObject])
    case diction([String: JSONObject])
    case number(NSNumber)
    case string(String)
    case null
    
    public var jsonString: String {
        var describe = ""
        switch self {
        case .array(let arr):
            describe = "[" + arr.map{$0.jsonString}.joined(separator: ",") + "]"
        case .diction(let dic):
            var strArr = [String]()
            for (k,v) in dic {
                let str = "\"" + k + "\":" + v.jsonString
                strArr.append(str)
            }
            describe = "{" + strArr.joined(separator: ",") + "}"
        case .number(let num):
            describe = "\(num)"
        case .string(let str):
            describe = "\"" + str + "\""
        case .null:
            describe = ""
        }
        return describe
    }
    
    public var description: String {
        jsonString
    }
    
    public var numberValue: NSNumber? {
        switch self {
        case .number(let n):
            return n
        case .string(let str):
            return NSNumber(pointer: str)
        default: return nil
        }
    }
    
    public var stringValue: String {
        switch self {
        case .number(let n):
            return String(describing: n)
        case .string(let str):
            return str
        default: return ""
        }
    }
    
    public subscript(_ key: String) -> JSONObject {
        switch self {
        case .diction(let dic):
            return dic[key] ?? .null
        default:return .null
        }
    }
    
    public subscript(_ index: Int) -> JSONObject {
        switch self {
        case .array(let arr):
            if arr.indices.contains(index) {
                return arr[index]
            }
            return .null
        default: return .null
        }
    }
    
    public static func make(_ any: Any) -> JSONObject {
        if let num = any as? NSNumber {
            return .number(num)
        }else if let arr = any as? [Any] {
            let arr = arr.map{
                JSONObject.make($0)
            }
            return .array(arr)
        }else if let dic = any as? [String: Any] {
            let dic = dic.mapValues{
                JSONObject.make($0)
            }
            return .diction(dic)
        }else if let str = any as? String {
            if let data = str.data(using: .utf8) {
                return .make(data)
            }
            return .string(str)
        }else if let data = any as? Data {
            if let obj = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) {
                return .make(obj)
            }
            if let str = String(data: data, encoding: .utf8) {
                return .string(str)
            }else {
                return .null
            }
        }
        return .null
    }
}
