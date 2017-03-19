/// Generated by the Protocol Buffers 3.2.0 compiler.  DO NOT EDIT!
/// Protobuf-swift version: 3.0.13
/// Source file "envelope.proto"
/// Syntax "Proto3"

import Foundation
import ProtocolBuffers


public struct EnvelopeRoot {
    public static let `default` = EnvelopeRoot()
    public var extensionRegistry:ExtensionRegistry

    init() {
        extensionRegistry = ExtensionRegistry()
        registerAllExtensions(registry: extensionRegistry)
        Google.Protobuf.AnyRoot.default.registerAllExtensions(registry: extensionRegistry)
    }
    public func registerAllExtensions(registry: ExtensionRegistry) {
    }
}

/// This is a common envelope for *all* messages in the system.
/// We only care about the correlationId, which allows us to track the messages in the
/// distributed system; the version, which, together with payloadType tells us how to
/// deserialize payload.
/// It is possible that some services will not even bother parsing the payload: some
/// don't care (e.g. counting, billing, ...); some can't, because the payload might
/// be encrypted.
final public class Envelope : GeneratedMessage {

    public static func == (lhs: Envelope, rhs: Envelope) -> Bool {
        if lhs === rhs {
            return true
        }
        var fieldCheck:Bool = (lhs.hashValue == rhs.hashValue)
        fieldCheck = fieldCheck && (lhs.hasCorrelationId == rhs.hasCorrelationId) && (!lhs.hasCorrelationId || lhs.correlationId == rhs.correlationId)
        fieldCheck = fieldCheck && (lhs.hasToken == rhs.hasToken) && (!lhs.hasToken || lhs.token == rhs.token)
        fieldCheck = fieldCheck && (lhs.hasPayload == rhs.hasPayload) && (!lhs.hasPayload || lhs.payload == rhs.payload)
        fieldCheck = (fieldCheck && (lhs.unknownFields == rhs.unknownFields))
        return fieldCheck
    }

    /// the correlationIds
    public fileprivate(set) var correlationId:String = ""
    public fileprivate(set) var hasCorrelationId:Bool = false

    /// the token issued by our authz service
    public fileprivate(set) var token:String = ""
    public fileprivate(set) var hasToken:Bool = false

    public fileprivate(set) var payload:Google.Protobuf.`Any`!
    public fileprivate(set) var hasPayload:Bool = false
    required public init() {
        super.init()
    }
    override public func isInitialized() -> Bool {
        return true
    }
    override public func writeTo(codedOutputStream: CodedOutputStream) throws {
        if hasCorrelationId {
            try codedOutputStream.writeString(fieldNumber: 1, value:correlationId)
        }
        if hasToken {
            try codedOutputStream.writeString(fieldNumber: 2, value:token)
        }
        if hasPayload {
            try codedOutputStream.writeMessage(fieldNumber: 4, value:payload)
        }
        try unknownFields.writeTo(codedOutputStream: codedOutputStream)
    }
    override public func serializedSize() -> Int32 {
        var serialize_size:Int32 = memoizedSerializedSize
        if serialize_size != -1 {
         return serialize_size
        }

        serialize_size = 0
        if hasCorrelationId {
            serialize_size += correlationId.computeStringSize(fieldNumber: 1)
        }
        if hasToken {
            serialize_size += token.computeStringSize(fieldNumber: 2)
        }
        if hasPayload {
            if let varSizepayload = payload?.computeMessageSize(fieldNumber: 4) {
                serialize_size += varSizepayload
            }
        }
        serialize_size += unknownFields.serializedSize()
        memoizedSerializedSize = serialize_size
        return serialize_size
    }
    public class func getBuilder() -> Envelope.Builder {
        return Envelope.classBuilder() as! Envelope.Builder
    }
    public func getBuilder() -> Envelope.Builder {
        return classBuilder() as! Envelope.Builder
    }
    override public class func classBuilder() -> ProtocolBuffersMessageBuilder {
        return Envelope.Builder()
    }
    override public func classBuilder() -> ProtocolBuffersMessageBuilder {
        return Envelope.Builder()
    }
    public func toBuilder() throws -> Envelope.Builder {
        return try Envelope.builderWithPrototype(prototype:self)
    }
    public class func builderWithPrototype(prototype:Envelope) throws -> Envelope.Builder {
        return try Envelope.Builder().mergeFrom(other:prototype)
    }
    override public func encode() throws -> Dictionary<String,Any> {
        guard isInitialized() else {
            throw ProtocolBuffersError.invalidProtocolBuffer("Uninitialized Message")
        }

        var jsonMap:Dictionary<String,Any> = Dictionary<String,Any>()
        if hasCorrelationId {
            jsonMap["correlationId"] = correlationId
        }
        if hasToken {
            jsonMap["token"] = token
        }
        if hasPayload {
            jsonMap["payload"] = try payload.encode()
        }
        return jsonMap
    }
    override class public func decode(jsonMap:Dictionary<String,Any>) throws -> Envelope {
        return try Envelope.Builder.decodeToBuilder(jsonMap:jsonMap).build()
    }
    override class public func fromJSON(data:Data) throws -> Envelope {
        return try Envelope.Builder.fromJSONToBuilder(data:data).build()
    }
    override public func getDescription(indent:String) throws -> String {
        var output = ""
        if hasCorrelationId {
            output += "\(indent) correlationId: \(correlationId) \n"
        }
        if hasToken {
            output += "\(indent) token: \(token) \n"
        }
        if hasPayload {
            output += "\(indent) payload {\n"
            if let outDescPayload = payload {
                output += try outDescPayload.getDescription(indent: "\(indent)  ")
            }
            output += "\(indent) }\n"
        }
        output += unknownFields.getDescription(indent: indent)
        return output
    }
    override public var hashValue:Int {
        get {
            var hashCode:Int = 7
            if hasCorrelationId {
                hashCode = (hashCode &* 31) &+ correlationId.hashValue
            }
            if hasToken {
                hashCode = (hashCode &* 31) &+ token.hashValue
            }
            if hasPayload {
                if let hashValuepayload = payload?.hashValue {
                    hashCode = (hashCode &* 31) &+ hashValuepayload
                }
            }
            hashCode = (hashCode &* 31) &+  unknownFields.hashValue
            return hashCode
        }
    }


    //Meta information declaration start

    override public class func className() -> String {
        return "Envelope"
    }
    override public func className() -> String {
        return "Envelope"
    }
    //Meta information declaration end

    final public class Builder : GeneratedMessageBuilder {
        fileprivate var builderResult:Envelope = Envelope()
        public func getMessage() -> Envelope {
            return builderResult
        }

        required override public init () {
            super.init()
        }
        /// the correlationIds
        public var correlationId:String {
            get {
                return builderResult.correlationId
            }
            set (value) {
                builderResult.hasCorrelationId = true
                builderResult.correlationId = value
            }
        }
        public var hasCorrelationId:Bool {
            get {
                return builderResult.hasCorrelationId
            }
        }
        @discardableResult
        public func setCorrelationId(_ value:String) -> Envelope.Builder {
            self.correlationId = value
            return self
        }
        @discardableResult
        public func clearCorrelationId() -> Envelope.Builder{
            builderResult.hasCorrelationId = false
            builderResult.correlationId = ""
            return self
        }
        /// the token issued by our authz service
        public var token:String {
            get {
                return builderResult.token
            }
            set (value) {
                builderResult.hasToken = true
                builderResult.token = value
            }
        }
        public var hasToken:Bool {
            get {
                return builderResult.hasToken
            }
        }
        @discardableResult
        public func setToken(_ value:String) -> Envelope.Builder {
            self.token = value
            return self
        }
        @discardableResult
        public func clearToken() -> Envelope.Builder{
            builderResult.hasToken = false
            builderResult.token = ""
            return self
        }
        /// the payload itself; a protobuf-encoded value
        public var payload:Google.Protobuf.`Any`! {
            get {
                if payloadBuilder_ != nil {
                    builderResult.payload = payloadBuilder_.getMessage()
                }
                return builderResult.payload
            }
            set (value) {
                builderResult.hasPayload = true
                builderResult.payload = value
            }
        }
        public var hasPayload:Bool {
            get {
                return builderResult.hasPayload
            }
        }
        fileprivate var payloadBuilder_:Google.Protobuf.`Any`.Builder! {
            didSet {
                builderResult.hasPayload = true
            }
        }
        public func getPayloadBuilder() -> Google.Protobuf.`Any`.Builder {
            if payloadBuilder_ == nil {
                payloadBuilder_ = Google.Protobuf.`Any`.Builder()
                builderResult.payload = payloadBuilder_.getMessage()
                if payload != nil {
                    try! payloadBuilder_.mergeFrom(other: payload)
                }
            }
            return payloadBuilder_
        }
        @discardableResult
        public func setPayload(_ value:Google.Protobuf.`Any`!) -> Envelope.Builder {
            self.payload = value
            return self
        }
        @discardableResult
        public func mergePayload(value:Google.Protobuf.`Any`) throws -> Envelope.Builder {
            if builderResult.hasPayload {
                builderResult.payload = try Google.Protobuf.`Any`.builderWithPrototype(prototype:builderResult.payload).mergeFrom(other: value).buildPartial()
            } else {
                builderResult.payload = value
            }
            builderResult.hasPayload = true
            return self
        }
        @discardableResult
        public func clearPayload() -> Envelope.Builder {
            payloadBuilder_ = nil
            builderResult.hasPayload = false
            builderResult.payload = nil
            return self
        }
        override public var internalGetResult:GeneratedMessage {
            get {
                return builderResult
            }
        }
        @discardableResult
        override public func clear() -> Envelope.Builder {
            builderResult = Envelope()
            return self
        }
        override public func clone() throws -> Envelope.Builder {
            return try Envelope.builderWithPrototype(prototype:builderResult)
        }
        override public func build() throws -> Envelope {
            try checkInitialized()
            return buildPartial()
        }
        public func buildPartial() -> Envelope {
            let returnMe:Envelope = builderResult
            return returnMe
        }
        @discardableResult
        public func mergeFrom(other:Envelope) throws -> Envelope.Builder {
            if other == Envelope() {
                return self
            }
            if other.hasCorrelationId {
                correlationId = other.correlationId
            }
            if other.hasToken {
                token = other.token
            }
            if (other.hasPayload) {
                try mergePayload(value: other.payload)
            }
            try merge(unknownField: other.unknownFields)
            return self
        }
        @discardableResult
        override public func mergeFrom(codedInputStream: CodedInputStream) throws -> Envelope.Builder {
            return try mergeFrom(codedInputStream: codedInputStream, extensionRegistry:ExtensionRegistry())
        }
        @discardableResult
        override public func mergeFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Envelope.Builder {
            let unknownFieldsBuilder:UnknownFieldSet.Builder = try UnknownFieldSet.builderWithUnknownFields(copyFrom:self.unknownFields)
            while (true) {
                let protobufTag = try codedInputStream.readTag()
                switch protobufTag {
                case 0: 
                    self.unknownFields = try unknownFieldsBuilder.build()
                    return self

                case 10:
                    correlationId = try codedInputStream.readString()

                case 18:
                    token = try codedInputStream.readString()

                case 34:
                    let subBuilder:Google.Protobuf.`Any`.Builder = Google.Protobuf.`Any`.Builder()
                    if hasPayload {
                        try subBuilder.mergeFrom(other: payload)
                    }
                    try codedInputStream.readMessage(builder: subBuilder, extensionRegistry:extensionRegistry)
                    payload = subBuilder.buildPartial()

                default:
                    if (!(try parse(codedInputStream:codedInputStream, unknownFields:unknownFieldsBuilder, extensionRegistry:extensionRegistry, tag:protobufTag))) {
                        unknownFields = try unknownFieldsBuilder.build()
                        return self
                    }
                }
            }
        }
        class override public func decodeToBuilder(jsonMap:Dictionary<String,Any>) throws -> Envelope.Builder {
            let resultDecodedBuilder = Envelope.Builder()
            if let jsonValueCorrelationId = jsonMap["correlationId"] as? String {
                resultDecodedBuilder.correlationId = jsonValueCorrelationId
            }
            if let jsonValueToken = jsonMap["token"] as? String {
                resultDecodedBuilder.token = jsonValueToken
            }
            if let jsonValuePayload = jsonMap["payload"] as? Dictionary<String,Any> {
                resultDecodedBuilder.payload = try Google.Protobuf.`Any`.Builder.decodeToBuilder(jsonMap:jsonValuePayload).build()

            }
            return resultDecodedBuilder
        }
        override class public func fromJSONToBuilder(data:Data) throws -> Envelope.Builder {
            let jsonData = try JSONSerialization.jsonObject(with:data, options: JSONSerialization.ReadingOptions(rawValue: 0))
            guard let jsDataCast = jsonData as? Dictionary<String,Any> else {
              throw ProtocolBuffersError.invalidProtocolBuffer("Invalid JSON data")
            }
            return try Envelope.Builder.decodeToBuilder(jsonMap:jsDataCast)
        }
    }

}

extension Envelope: GeneratedMessageProtocol {
    public class func parseArrayDelimitedFrom(inputStream: InputStream) throws -> Array<Envelope> {
        var mergedArray = Array<Envelope>()
        while let value = try parseDelimitedFrom(inputStream: inputStream) {
          mergedArray.append(value)
        }
        return mergedArray
    }
    public class func parseDelimitedFrom(inputStream: InputStream) throws -> Envelope? {
        return try Envelope.Builder().mergeDelimitedFrom(inputStream: inputStream)?.build()
    }
    public class func parseFrom(data: Data) throws -> Envelope {
        return try Envelope.Builder().mergeFrom(data: data, extensionRegistry:EnvelopeRoot.default.extensionRegistry).build()
    }
    public class func parseFrom(data: Data, extensionRegistry:ExtensionRegistry) throws -> Envelope {
        return try Envelope.Builder().mergeFrom(data: data, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(inputStream: InputStream) throws -> Envelope {
        return try Envelope.Builder().mergeFrom(inputStream: inputStream).build()
    }
    public class func parseFrom(inputStream: InputStream, extensionRegistry:ExtensionRegistry) throws -> Envelope {
        return try Envelope.Builder().mergeFrom(inputStream: inputStream, extensionRegistry:extensionRegistry).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream) throws -> Envelope {
        return try Envelope.Builder().mergeFrom(codedInputStream: codedInputStream).build()
    }
    public class func parseFrom(codedInputStream: CodedInputStream, extensionRegistry:ExtensionRegistry) throws -> Envelope {
        return try Envelope.Builder().mergeFrom(codedInputStream: codedInputStream, extensionRegistry:extensionRegistry).build()
    }
    public subscript(key: String) -> Any? {
        switch key {
        case "correlationId": return self.correlationId
        case "token": return self.token
        case "payload": return self.payload
        default: return nil
        }
    }
}
extension Envelope.Builder: GeneratedMessageBuilderProtocol {
    public subscript(key: String) -> Any? {
        get { 
            switch key {
            case "correlationId": return self.correlationId
            case "token": return self.token
            case "payload": return self.payload
            default: return nil
            }
        }
        set (newSubscriptValue) { 
            switch key {
            case "correlationId":
                guard let newSubscriptValue = newSubscriptValue as? String else {
                    return
                }
                self.correlationId = newSubscriptValue
            case "token":
                guard let newSubscriptValue = newSubscriptValue as? String else {
                    return
                }
                self.token = newSubscriptValue
            case "payload":
                guard let newSubscriptValue = newSubscriptValue as? Google.Protobuf.`Any` else {
                    return
                }
                self.payload = newSubscriptValue
            default: return
            }
        }
    }
}

// @@protoc_insertion_point(global_scope)