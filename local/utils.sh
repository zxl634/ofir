#!/usr/bin/env bash

_script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export DJANGO_SETTINGS_MODULE=djangofir.settings.development

function ofir {
  local _venv_name=venv
  local _venv_dir="python/$_venv_name"
  local _django_name=djangofir
  local _this=${FUNCNAME[0]}
  local _nextjs_name="nextjs"
  function _print_and_do () {
    echo -e "\n>>> running: $*\n" && eval "$@"
  }
  function _manage_py {
    local _pm="$_script_dir/../$_venv_dir/bin/python manage.py"
    local _app_name="jobs"
    cd "$_django_name" || return
    case "$1" in
      rs) _print_and_do "$_pm runserver";;
      startmyapp) _print_and_do "$_pm startapp $_app_name";;
      *) _print_and_do "$_pm $*";;
    esac
    cd - || return
  }
  function _setup {
    case "$1" in
      clean) _print_and_do "rm -rf $_venv_dir $_django_name $_nextjs_name";;
      venv) _print_and_do "python3 -m venv $_venv_dir";;
      mypip) _print_and_do "$_venv_dir/bin/pip install -r python/requirements.txt";;
      pip) _print_and_do "$_venv_dir/bin/pip ${*:2}";;
      django) _print_and_do "$_venv_dir/bin/django-admin startproject $_django_name" && _print_and_do "$_this pm startmyapp";;
      nextjs) _print_and_do "npx create-next-app --use-npm $_nextjs_name";;
      *) "$_this" setup venv && "$_this" setup mypip && "$_this" setup django && "$_this" setup nextjs;;
    esac
  }
  case "$1" in
    setup) _setup "${@:2}";;
    pm) _manage_py "${@:2}";;
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
  if [[ "${COMP_WORDS[1]}" == "setup" ]]; then
    _set_compreply "clean venv pip mypip django nextjs" "${COMP_WORDS[2]}"
  elif [[ "${COMP_WORDS[1]}" == "pm" ]]; then
    _set_compreply "rs" "${COMP_WORDS[2]}"
  else
    _set_compreply "setup pm" "${COMP_WORDS[1]}"
  fi
}

complete -F _ofir_completions ofir
