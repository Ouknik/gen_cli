String ValueIsNull(String value) {
  if (value == "" || value.toString().toLowerCase() == "null") {
    return "";
  }

  return value;
}
