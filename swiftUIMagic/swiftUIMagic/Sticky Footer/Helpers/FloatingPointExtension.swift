extension FloatingPoint {

    /// Maps the receiver into the given range by clamping it to the given domain and then
    /// projecting the domain onto the given range.
    /// - Parameters:
    ///   - domain: The domain start and end bounds.
    ///   - range: The range start and end bounds.
    /// - Returns: The corresponding projected value within the range.
    func map(domain: (Self, Self), range: (Self, Self)) -> Self {
        let domainMin = min(domain.0, domain.1)
        let domainMax = max(domain.0, domain.1)
        let limitedDomainValue = min(max(self, domainMin), domainMax)
        let normalizedDomainValue = limitedDomainValue - domain.0
        let valuePercent = normalizedDomainValue / (domain.1 - domain.0)
        let rangeValue = range.0 + (range.1 - range.0) * valuePercent
        return rangeValue
    }
}
