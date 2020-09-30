# inspec_wrapper_with_input
An InSpec wrapper profile example that child profiles and passes input variables
  
The input `amplifier_max_volume` is passed from the Wrapper to the Child and Child2.

The Child input value is:  
```yml
inputs:
- name: amplifier_max_volume
  value: 2
- name: amplifier_max_volume_child_1
  value: 200
```
  
The Child2 input value is:  
```yml
inputs:
- name: amplifier_max_volume
  value: 6
- name: amplifier_max_volume_child_2
  value: 600
```
  
The Wrapper input value is:  
```yml
depends:
- name: child
  path: ../child
- name: child2
  path: ../child2
inputs:
- name: amplifier_max_volume
- name: amplifier_max_volume_child_1
- name: amplifier_max_volume_child_2
```

### Run it
  
Run it from the Wrapper which will execute the child and child2 profile.  The `input` is passed in from the Wrapper profile.

```bash
cd wrapper
```
  
Now execute the InSpec test and pass in the `inputs`
```bash
inspec exec . --input amplifier_max_volume=1400 amplifier_max_volume_child_1=2400 amplifier_max_volume_child_2=3400
```

```bash
Profile: InSpec Profile (child)
Version: 0.1.0
Target:  local://

  ×  Child 1 - Big Rock Show: 1400 (2 failed)
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)

     ×  2400 is expected to cmp == 110

     expected: 110
          got: 2400

     (compared using `cmp` matcher)



Profile: InSpec Profile (child2)
Version: 0.1.0
Target:  local://

  ×  Child2 - Small Rock Show: 1400 (2 failed)
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)

     ×  3400 is expected to cmp == 110

     expected: 110
          got: 3400

     (compared using `cmp` matcher)



Profile Summary: 0 successful controls, 2 control failures, 0 controls skipped
Test Summary: 0 successful, 4 failures, 0 skipped
```
  
  
### Vendor
InSpec can download all dependencies and generate a lockfile in a vendor directory.
  
The command is run from the ` inspec_wrapper_with_input` directory :
```bash
inspec vendor wrapper/ --overwrite && inspec exec --log-level=debug wrapper/ --input amplifier_max_volume=1400 amplifier_max_volume_child_1=2400 amplifier_max_volume_child_2=3400
```
  
The vendor output will produce a `inspec.lock` file like this with all the dependencies:
```bash
---
lockfile_version: 1
depends:
- name: child
  resolved_source:
    path: "/Users/me/src/inspec/inspec_wrapper_with_input/child"
    sha256: b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71
  version_constraints: []
- name: child2
  resolved_source:
    path: "/Users/me/src/inspec/inspec_wrapper_with_input/child2"
    sha256: dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f
  version_constraints: []
```
  
Your output will look like this:
```bash
inspec vendor wrapper/ --overwrite && inspec exec --log-level=debug wrapper/ --input amplifier_max_volume=1400 amplifier_max_volume_child_1=2400 amplifier_max_volume_child_2=3400
Dependencies for profile wrapper/ successfully vendored to /Users/me/src/inspec/inspec_wrapper_with_input/wrapper/vendor
[2020-09-30T15:11:26+10:00] DEBUG: Option backend_cache is enabled
[2020-09-30T15:11:26+10:00] DEBUG: Resolve wrapper/ into cache /Users/anthonyrees/.inspec/cache
[2020-09-30T15:11:26+10:00] DEBUG: Dependency does not exist in the cache wrapper/
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f/inspec.json to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f/README.md to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f/controls/example.rb to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f/inspec.yml to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71/inspec.json to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71/README.md to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71/controls/example.rb to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Copy /Users/me/.inspec/cache/b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71/inspec.yml to cache directory
[2020-09-30T15:11:26+10:00] DEBUG: Starting run with targets: ["Inspec::Profile<wrapper>"]
[2020-09-30T15:11:26+10:00] DEBUG: Using existing lockfile wrapper/inspec.lock
[2020-09-30T15:11:26+10:00] DEBUG: Using cached dependency for {:path=>"/Users/me/src/inspec/inspec_wrapper_with_input/child", :sha256=>"b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71", :backend=>Inspec::Backend::Class @transport=Train::Transports::Local::Connection, :inputs=>nil}
[2020-09-30T15:11:26+10:00] DEBUG: Using cached dependency for {:path=>"/Users/me/src/inspec/inspec_wrapper_with_input/child2", :sha256=>"dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f", :backend=>Inspec::Backend::Class @transport=Train::Transports::Local::Connection, :inputs=>nil}
[2020-09-30T15:11:26+10:00] DEBUG: Loading /Users/me/.inspec/cache/b089542b1d38a7f9139e3930fa8030d21263b7a85b7748dd8b084b8088f4da71/controls/example.rb into #<Inspec::ProfileContext:0x00007ff8fb4dcb68>
[2020-09-30T15:11:26+10:00] DEBUG: Loading /Users/me/.inspec/cache/dcc5d3ba68744288fe1230718d7d07226b6547157a64eebea1c71993884d229f/controls/example.rb into #<Inspec::ProfileContext:0x00007ff8fb934620>
[2020-09-30T15:11:26+10:00] DEBUG: Loading wrapper/controls/example.rb into #<Inspec::ProfileContext:0x00007ff8fb9ccfd8>
[2020-09-30T15:11:26+10:00] DEBUG: Registering rule Child 1 - Big Rock Show
[2020-09-30T15:11:26+10:00] DEBUG: Registering rule Child2 - Small Rock Show

Profile: InSpec Profile (wrapper)
Version: 0.1.0
Target:  local://

     No tests executed.

Profile: InSpec Profile (child)
Version: 0.1.0
Target:  local://

  ×  Child 1 - Big Rock Show: 1400 (2 failed)
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)

     ×  2400 is expected to cmp == 110

     expected: 110
          got: 2400

     (compared using `cmp` matcher)



Profile: InSpec Profile (child2)
Version: 0.1.0
Target:  local://

  ×  Child2 - Small Rock Show: 1400 (2 failed)
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)

     ×  3400 is expected to cmp == 110

     expected: 110
          got: 3400

     (compared using `cmp` matcher)



Profile Summary: 0 successful controls, 2 control failures, 0 controls skipped
Test Summary: 0 successful, 4 failures, 0 skipped
```

