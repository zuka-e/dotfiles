case "$(locale -a)" in
  *'en_US.UTF-8'*)
    LANG='en_US.UTF-8'
    ;;
  *'C.UTF-8'*)
    LANG='C.UTF-8'
    ;;
esac

export LANG
