# Append the path to `PATH` unless missing.
path_append() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$PATH:$1" ;;
  esac
}

# Prepend the path to `PATH` unless missing.
path_prepend() {
  case ":$PATH:" in
    *":$1:"*) ;;
    *) PATH="$1:$PATH" ;;
  esac
}
