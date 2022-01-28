#!/usr/bin/env bash

_script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function ofir {
  local _venv_name=venv
  local _venv_dir="$_script_dir/../python/$_venv_name"
  local _django_name=djangofir
  local _this=${FUNCNAME[0]}
  local _nextjs_name="nextjs"
  function _print_and_do () {
    echo -e "\n>>> running: $*\n" && eval "$@"
  }
  function _manage_py {
    local _pm="$_venv_dir/bin/python manage.py"
    _print_and_do "$_this set-env dev"
    cd "$_django_name" || return
    case "$1" in
      rs) _print_and_do "$_pm runserver";;
      *) _print_and_do "$_pm $*";;
    esac
    cd - || return
  }
  function _setup {
    echo "Deprecated"
    ## case "$1" in
    ##   clean) _print_and_do "rm -rf $_venv_dir $_django_name $_nextjs_name";;
    ##   venv) _print_and_do "python3 -m venv $_venv_dir";;
    ##   mypip) _print_and_do "$_venv_dir/bin/pip install -r python/requirements.txt";;
    ##   pip) _print_and_do "$_venv_dir/bin/pip ${*:2}";;
    ##   django) _print_and_do "$_venv_dir/bin/django-admin startproject $_django_name" && _print_and_do "$_this pm startmyapp";;
    ##   nextjs) _print_and_do "npx create-next-app --use-npm $_nextjs_name";;
    ##   *) echo "unknown command";;
    ## esac
  }
  function _venv {
    _print_and_do "$_venv_dir/bin/$*"
  }
  function _set_env {
    case "$1" in
      dev) _print_and_do "export DJANGO_SETTINGS_MODULE=$_django_name.settings.development";;
      test) _print_and_do "export DJANGO_SETTINGS_MODULE=$_django_name.settings.testing";;
      *) echo "unknown command";;
    esac
  }
  function _test {
    _print_and_do "$_this set-env test"
    cd "$_django_name" || return
    "$_venv_dir/bin/pytest" 
    cd - || return
  }
  function _next {
    _print_and_do "cd $_nextjs_name"
    _print_and_do "npm run dev"
  }
  case "$1" in
    venv) _venv "${@:2}";;
    set-env) _set_env "${@:2}";;
    pm) _manage_py "${@:2}";;
    next) _next "${@:2}";;
    test) _test "${@:2}";;
    *) echo "unknown command";;
  esac
  }

function _ofir_completions {
  function _set_compreply {
    _completion_words="$1"
    _existing_typed_characters="$2"
    if [[ "$_existing_typed_characters" == "*$_completion_words*" ]]; then
      COMPREPLY=("")
    else
      mapfile -t < <(compgen -W "$_completion_words" "$_existing_typed_characters")
      COMPREPLY=("${MAPFILE[@]}")
    fi
  }
  if [[ "${COMP_WORDS[1]}" == "pm" ]]; then
    _set_compreply "rs" "${COMP_WORDS[2]}"
  elif [[ "${COMP_WORDS[1]}" == "set-env" ]]; then
    _set_compreply "dev test" "${COMP_WORDS[2]}"
  else
    _set_compreply "next test pm set-env venv" "${COMP_WORDS[1]}"
  fi
}

complete -F _ofir_completions ofir
