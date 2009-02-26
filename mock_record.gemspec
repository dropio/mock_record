# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mock_record}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Jaros"]
  s.date = %q{2009-02-26}
  s.description = %q{A mock object which stands in for ORM objects.}
  s.email = %q{peeja@dropio.com}
  s.files = ["VERSION.yml", "lib/mock_records", "lib/mock_records/mock_record.rb", "lib/mock_records/mock_record_argument_matcher.rb", "lib/mock_records/mock_record_stubbing.rb", "lib/mock_records.rb", "spec/mock_records", "spec/mock_records/mock_record_argument_matcher_spec.rb", "spec/mock_records/mock_record_spec.rb", "spec/mock_records/mock_record_stubbing_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A mock object which stands in for ORM objects.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
