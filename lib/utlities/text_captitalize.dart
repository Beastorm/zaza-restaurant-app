String capitalizeText(String value) {
  return value.substring(0, 1).toUpperCase() +
      value.substring(1, value.length).toLowerCase();
}
