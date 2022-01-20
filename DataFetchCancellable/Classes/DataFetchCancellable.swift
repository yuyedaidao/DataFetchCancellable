//
//  DataFetchCancellable.swift
//  DataFetchCancellable
//
//  Created by 王叶庆 on 2021/3/8.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Moya
import YQListViewModel

public class DataFetchCancellable: FetchCancellable {
    init(_ cancellable: Cancellable) {
        self.cancellable = cancellable
    }

    public var isCancelled: Bool {
        return cancellable.isCancelled
    }

    public func cancel() {
        cancellable.cancel()
    }

    let cancellable: Cancellable
}

public extension Cancellable {
    func asFetchCancellable() -> FetchCancellable {
        return DataFetchCancellable(self)
    }
}

public class EmptyFetchCancellable: FetchCancellable {
    public var isCancelled: Bool = false
    public func cancel() {
        isCancelled = true
        // do nothing
    }
}
