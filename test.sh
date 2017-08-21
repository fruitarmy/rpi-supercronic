set -uo pipefail

info() {
  printf "%s\n" "$@"
}

fatal() {
  printf "**********\n"
  printf "%s\n" "$@"
  printf "**********\n"
  exit 1
}

cd $(cd ${0%/*} && pwd -P);

docker run fruitarmy/rpi-supercronic --help

if [[ $? -ne 2 ]]; then
  fatal "Test failed!"
else
  info "Test succeeded."
fi

info "All tests successful!"

exit 0