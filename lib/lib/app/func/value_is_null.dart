String ValueIsNull(String value) {
  if (value == "" || value.toString().toLowerCase() == "null") {
    return "";
  }

  if (value == "%!s(<nil>") {
    return "";
  }

  if (value == "%!s(\u003cnil\u003e)") {
    return "";
  }
  return value;
}
