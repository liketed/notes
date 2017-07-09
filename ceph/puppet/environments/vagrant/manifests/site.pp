# Pull classes from hiera
lookup('classes', Array[String], 'unique').include
Package {
  allow_virtual => false,
}
