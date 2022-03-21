# frozen_string_literal: true

class APIConstraint
  HEADER_ACCEPT_REGEXP = %r{\A(application/json|application/vnd\.secretly\.v\d\+json)\z}
  attr_reader :version

  def initialize(version: "")
    @version = version
  end

  def matches?(request)
    request.accept.to_s.match?(HEADER_ACCEPT_REGEXP) && request.accept == mime_type.to_s
  end

  private

  def mime_type
    Mime::Type.lookup_by_extension(version)
  end
end
