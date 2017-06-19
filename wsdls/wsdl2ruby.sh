#!/usr/bin/env bash
cd /wsdls

which ruby

/usr/local/rvm/gems/ruby-1.8.7-head/bin/wsdl2ruby.rb --wsdl JCIMobilitySafetyPositionWS.WSDL --type client --classdef JCIMobilitySafetyPositionWS --module_path JCIMobilitySafetyPositionWS --force
