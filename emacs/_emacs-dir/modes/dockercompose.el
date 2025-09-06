;;; dockercompose.el --- Major mode for editing dockercompose files -*- lexical-binding: t; -*-

;; Copyright (C) 2017-2018  Ricardo Martins

;; Author: Ricardo Martins
;; URL: https://github.com/meqif/dockercompose
;; Version: 1.1.0
;; Keywords: convenience
;; Package-Requires: ((emacs "24.3") (dash "2.12.0") (yaml-mode "0.0.12"))

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;; http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Commentary:

;; Major mode for editing dockercompose files, providing context-aware
;; completion of dockercompose keys through completion-at-point-functions.
;;
;; The completions can be used with the completion system shipped with vanilla
;; Emacs, and 3rd-party frontends like company-mode, autocomplete, and
;; ido-at-point.
;;
;; By default, the keyword completion function detects the dockercompose
;; version of the current buffer and suggests the appropriate keywords.
;;
;; See the README for more details.

;;; Code:

(require 'cl-lib)
;; (require 'dash)

(defgroup dockercompose nil
  "Major mode for editing dockercompose files."
  :group 'languages
  :prefix "dockercompose-")

(defcustom dockercompose-keywords
  '(
    ("1.0" ("^[a-zA-Z0-9._-]+$" ("build") ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("cpu_shares") ("cpu_quota") ("cpuset") ("devices") ("dns") ("dns_search") ("dockerfile") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("extends" ("service") ("file")) ("extra_hosts" (".+")) ("external_links") ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("log_driver") ("log_opt") ("mac_address") ("mem_limit") ("memswap_limit") ("mem_swappiness") ("net") ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("stdin_open") ("stop_signal") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("volumes") ("volume_driver") ("volumes_from") ("working_dir")))
    ("2.0" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("blkio_config" ("device_read_bps") ("device_read_iops") ("device_write_bps") ("device_write_iops") ("weight") ("weight_device")) ("build" ("context") ("dockerfile") ("args" (".+"))) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("cpu_shares") ("cpu_quota") ("cpuset") ("depends_on") ("devices") ("dns") ("dns_opt") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("extends" ("service") ("file")) ("external_links") ("extra_hosts" (".+")) ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("logging" ("driver") ("options")) ("mac_address") ("mem_limit") ("mem_reservation") ("mem_swappiness") ("memswap_limit") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address") ("priority"))) ("oom_score_adj") ("group_add") ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("volumes") ("volume_driver") ("volumes_from") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config") ("options" ("^.+$"))) ("external" ("name")) ("internal"))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")))) ("^x-"))
    ("2.1" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("blkio_config" ("device_read_bps") ("device_read_iops") ("device_write_bps") ("device_write_iops") ("weight") ("weight_device")) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+"))) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("cpu_shares") ("cpu_quota") ("cpu_period") ("cpuset") ("depends_on" ("^[a-zA-Z0-9._-]+$" ("condition"))) ("devices") ("dns_opt") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("extends" ("service") ("file")) ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout")) ("hostname") ("image") ("ipc") ("isolation") ("labels" (".+")) ("links") ("logging" ("driver") ("options")) ("mac_address") ("mem_limit") ("mem_reservation") ("mem_swappiness") ("memswap_limit") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address") ("link_local_ips") ("priority"))) ("oom_kill_disable") ("oom_score_adj") ("group_add") ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("sysctls" (".+")) ("pids_limit") ("stdin_open") ("stop_grace_period") ("stop_signal") ("storage_opt") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("volume_driver") ("volumes_from") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config") ("options" ("^.+$"))) ("external" ("name")) ("internal") ("enable_ipv6") ("labels" (".+")) ("name"))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")) ("name"))) ("^x-"))
    ("2.2" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("blkio_config" ("device_read_bps") ("device_read_iops") ("device_write_bps") ("device_write_iops") ("weight") ("weight_device")) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from") ("network")) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("cpu_count") ("cpu_percent") ("cpu_shares") ("cpu_quota") ("cpu_period") ("cpus") ("cpuset") ("depends_on" ("^[a-zA-Z0-9._-]+$" ("condition"))) ("devices") ("dns_opt") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("extends" ("service") ("file")) ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout")) ("hostname") ("image") ("init") ("ipc") ("isolation") ("labels" (".+")) ("links") ("logging" ("driver") ("options")) ("mac_address") ("mem_limit") ("mem_reservation") ("mem_swappiness") ("memswap_limit") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address") ("link_local_ips") ("priority"))) ("oom_kill_disable") ("oom_score_adj") ("group_add") ("pid") ("ports") ("privileged") ("read_only") ("restart") ("scale") ("security_opt") ("shm_size") ("sysctls" (".+")) ("pids_limit") ("stdin_open") ("stop_grace_period") ("stop_signal") ("storage_opt") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("volume_driver") ("volumes_from") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config") ("options" ("^.+$"))) ("external" ("name")) ("internal") ("enable_ipv6") ("labels" (".+")) ("name"))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")) ("name"))) ("^x-"))
    ("2.3" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("blkio_config" ("device_read_bps") ("device_read_iops") ("device_write_bps") ("device_write_iops") ("weight") ("weight_device")) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from") ("network") ("target") ("shm_size") ("extra_hosts" (".+"))) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("cpu_count") ("cpu_percent") ("cpu_shares") ("cpu_quota") ("cpu_period") ("cpus") ("cpuset") ("depends_on" ("^[a-zA-Z0-9._-]+$" ("condition"))) ("device_cgroup_rules") ("devices") ("dns_opt") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("extends" ("service") ("file")) ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("start_period") ("test") ("timeout")) ("hostname") ("image") ("init") ("ipc") ("isolation") ("labels" (".+")) ("links") ("logging" ("driver") ("options")) ("mac_address") ("mem_limit") ("mem_reservation") ("mem_swappiness") ("memswap_limit") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address") ("link_local_ips") ("priority"))) ("oom_kill_disable") ("oom_score_adj") ("group_add") ("pid") ("ports") ("privileged") ("read_only") ("restart") ("runtime") ("scale") ("security_opt") ("shm_size") ("sysctls" (".+")) ("pids_limit") ("stdin_open") ("stop_grace_period") ("stop_signal") ("storage_opt") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("volume_driver") ("volumes_from") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config") ("options" ("^.+$"))) ("external" ("name")) ("internal") ("enable_ipv6") ("labels" (".+")) ("name"))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")) ("name"))) ("^x-"))
    ("3.0" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints"))) ("build" ("context") ("dockerfile") ("args" (".+"))) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout")) ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))))
    ("3.1" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints"))) ("build" ("context") ("dockerfile") ("args" (".+"))) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout")) ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("secrets") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))) ("secrets" ("^[a-zA-Z0-9._-]+$" ("file") ("external" ("name")) ("labels" (".+")))))
    ("3.2" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("endpoint_mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints"))) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from")) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("container_name") ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout")) ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("secrets") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("attachable") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))) ("secrets" ("^[a-zA-Z0-9._-]+$" ("file") ("external" ("name")) ("labels" (".+")))))
    ("3.3" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("endpoint_mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints") ("preferences"))) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from")) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("configs") ("container_name") ("credential_spec" ("file") ("registry")) ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout")) ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("secrets") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("attachable") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))) ("secrets" ("^[a-zA-Z0-9._-]+$" ("file") ("external" ("name")) ("labels" (".+")))) ("configs" ("^[a-zA-Z0-9._-]+$" ("file") ("external" ("name")) ("labels" (".+")))))
    ("3.4" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("endpoint_mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio") ("order")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints") ("preferences"))) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from") ("network") ("target")) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("configs") ("container_name") ("credential_spec" ("file") ("registry")) ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout") ("start_period")) ("hostname") ("image") ("ipc") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("secrets") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("attachable") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("name") ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))) ("secrets" ("^[a-zA-Z0-9._-]+$" ("file") ("external" ("name")) ("labels" (".+")))) ("configs" ("^[a-zA-Z0-9._-]+$" ("file") ("external" ("name")) ("labels" (".+")))) ("^x-"))
    ("3.5" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("endpoint_mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio") ("order")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory") ("generic_resources"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints") ("preferences"))) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from") ("network") ("target") ("shm_size")) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("configs") ("container_name") ("credential_spec" ("file") ("registry")) ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout") ("start_period")) ("hostname") ("image") ("ipc") ("isolation") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("secrets") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("name") ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("attachable") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("name") ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))) ("secrets" ("^[a-zA-Z0-9._-]+$" ("name") ("file") ("external" ("name")) ("labels" (".+")))) ("configs" ("^[a-zA-Z0-9._-]+$" ("name") ("file") ("external" ("name")) ("labels" (".+")))) ("^x-"))
    ("3.6" ("version") ("services" ("^[a-zA-Z0-9._-]+$" ("deploy" ("mode") ("endpoint_mode") ("replicas") ("labels" (".+")) ("update_config" ("parallelism") ("delay") ("failure_action") ("monitor") ("max_failure_ratio") ("order")) ("resources" ("limits" ("cpus") ("memory")) ("reservations" ("cpus") ("memory") ("generic_resources"))) ("restart_policy" ("condition") ("delay") ("max_attempts") ("window")) ("placement" ("constraints") ("preferences"))) ("build" ("context") ("dockerfile") ("args" (".+")) ("labels" (".+")) ("cache_from") ("network") ("target") ("shm_size")) ("cap_add") ("cap_drop") ("cgroup_parent") ("command") ("configs") ("container_name") ("credential_spec" ("file") ("registry")) ("depends_on") ("devices") ("dns") ("dns_search") ("domainname") ("entrypoint") ("env_file") ("environment" (".+")) ("expose") ("external_links") ("extra_hosts" (".+")) ("healthcheck" ("disable") ("interval") ("retries") ("test") ("timeout") ("start_period")) ("hostname") ("image") ("ipc") ("isolation") ("labels" (".+")) ("links") ("logging" ("driver") ("options" ("^.+$"))) ("mac_address") ("network_mode") ("networks" ("^[a-zA-Z0-9._-]+$" ("aliases") ("ipv4_address") ("ipv6_address"))) ("pid") ("ports") ("privileged") ("read_only") ("restart") ("security_opt") ("shm_size") ("secrets") ("sysctls" (".+")) ("stdin_open") ("stop_grace_period") ("stop_signal") ("tmpfs") ("tty") ("ulimits" ("^[a-z]+$" ("hard") ("soft"))) ("user") ("userns_mode") ("volumes") ("working_dir"))) ("networks" ("^[a-zA-Z0-9._-]+$" ("name") ("driver") ("driver_opts" ("^.+$")) ("ipam" ("driver") ("config")) ("external" ("name")) ("internal") ("attachable") ("labels" (".+")))) ("volumes" ("^[a-zA-Z0-9._-]+$" ("name") ("driver") ("driver_opts" ("^.+$")) ("external" ("name")) ("labels" (".+")))) ("secrets" ("^[a-zA-Z0-9._-]+$" ("name") ("file") ("external" ("name")) ("labels" (".+")))) ("configs" ("^[a-zA-Z0-9._-]+$" ("name") ("file") ("external" ("name")) ("labels" (".+")))) ("^x-")))
  "Association list of dockercompose keywords for each version."
  :type '(alist :key-type string :value-type (repeat string))
  :group 'dockercompose)

(defun dockercompose--find-version ()
  "Find the version of the dockercompose file.
It is assumed that files lacking an explicit 'version' key are
version 1."
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward "^version:\s*" (point-at-eol) t 1)
        (when (looking-at "\\([\"']\\)\\([0-9]\\(?:\.[0-9]+\\(?:-\\w+\\)?\\)?\\)\\1$")
          (match-string-no-properties 2))
      "1.0")))

(defun dockercompose--normalize-version (version)
  "Normalize VERSION to conform to <major>.<minor>."
  (if (string-match-p "^[0-9]$" version)
      (concat version ".0")
    version))

(defun dockercompose--keywords-for-buffer ()
  "Obtain keywords appropriate for the current buffer's dockercompose version.

If the version is not present in `dockercompose-keywords', the
final (most recent) entry in it is used."
  (-when-let* ((version (-some-> (dockercompose--find-version)
                                 (dockercompose--normalize-version))))
      (cdr (or (assoc version dockercompose-keywords)
               (car (last dockercompose-keywords))))))

(defun dockercompose--post-completion (_string status)
  "Execute actions after completing with candidate.
Read the documentation for the `completion-extra-properties'
variable for additional information about STRING and STATUS."
  (when (eq status 'finished)
    (insert ": ")))

(defun dockercompose--find-context ()
  "Return a list with the ancestor keys of the current point."
  (save-excursion
    (beginning-of-line)
    (-let* ((keywords nil)
            (previous-indentation (skip-chars-forward "\t "))
            (current-indentation nil))
      (cl-loop
       do
       (forward-line -1)
       (setq current-indentation (skip-chars-forward "\t "))
       (when (and (< current-indentation previous-indentation)
                  (looking-at "\\([a-zA-Z][a-zA-Z0-9_]+\\):"))
         (setq previous-indentation current-indentation)
         (push (match-string-no-properties 1) keywords))

       until (or (= previous-indentation 0) (bobp)))
      keywords)))

(defun dockercompose--find-subtree (nodes tree)
  "Search a TREE of keywords for the subtree matching a sequence of the parent NODES."
  (if nodes
      (-when-let* ((node (car nodes))
                   (subtree (--find (string-match-p (car it) node) tree)))
        (dockercompose--find-subtree (cdr nodes) (cdr subtree)))
    tree))

(defun dockercompose--filter-candidates-tree (prefix tree)
  "Return a list of candidate keywords matching a PREFIX in a keyword TREE."
  (let ((candidates nil))
    (dolist (subtree tree (nreverse candidates))
      (when (string-prefix-p prefix (car subtree))
        (push (car subtree) candidates)))))

(defun dockercompose--candidates (prefix)
  "Obtain applicable candidates from the keywords list for the PREFIX."
  (-let* ((keywords (dockercompose--keywords-for-buffer))
          (nodes (dockercompose--find-context))
          (subtree (dockercompose--find-subtree nodes keywords)))
    (if prefix
        (dockercompose--filter-candidates-tree prefix subtree)
      (-map #'car subtree))))

(defun dockercompose--prefix ()
  "Get a prefix and its starting and ending points from the current position."
  (save-excursion
    (beginning-of-line)
    (when (looking-at "^[\t ]*\\([a-zA-Z][a-zA-Z0-9_]+\\)$")
      (list (match-string-no-properties 1) (match-beginning 1) (match-end 1)))))

(defun dockercompose-keyword-complete-at-point ()
  "`completion-at-point-functions' function for dockercompose keywords."
  (-when-let* (((prefix start end) (dockercompose--prefix)))
    (list start end (dockercompose--candidates prefix)
          :exclusive 'yes
          :company-docsig #'identity
          :exit-function #'dockercompose--post-completion)))

(declare-function yaml-mode "ext:yaml-mode")

;;;###autoload
(define-derived-mode dockercompose yaml-mode "dockercompose"
  "Major mode to edit dockercompose files."
  (setq-local completion-at-point-functions
              '(dockercompose-keyword-complete-at-point)))

;;;###autoload
(add-to-list 'auto-mode-alist
             '("dockercompose[^/]*\\.ya?ml\\'" . dockercompose))

(provide 'dockercompose)
;;; dockercompose.el ends here
