module MetricFu
  class Version
    MAJOR = "4"
    MINOR = "12"
    PATCH = "0"
    PRE   = ""
  end
  VERSION = [Version::MAJOR, Version::MINOR, Version::PATCH].join(".")
end
