# inspec_wrapper_with_input
An InSpec wrapper profile example that child profiles and passes input variables
  
The input `amplifier_max_volume` is passed from the Wrapper to the Child and Child2.

The Child input value is:  
```yml
inputs:
- name: amplifier_max_volume_child
  value: 2
```
  
The Child2 input value is:  
```yml
inputs:
- name: amplifier_max_volume_child2
  value: 6
```
  
The Wrapper input value is:  
```yml
ddepends:
  - name: child
    path: ../child
  - name: child2
    path: ../child2
inputs:
  - name: amplifier_max_volume_child
    value: 1400
    profile: child
  - name: amplifier_max_volume_child2
    value: 1400
    profile: child2
```

### Run it
  
Run it from the Wrapper which will execute the child and child2 profile.  The `input` is passed in from the Wrapper profile.

```bash
cd wrapper
inspec exec .
```

```bash
Profile: InSpec Profile (child)
Version: 0.1.0
Target:  local://

  ×  Child - Big Rock Show: 1400
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)



Profile: InSpec Profile (child2)
Version: 0.1.0
Target:  local://

  ×  Child2 - Small Rock Show: 1400
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)



Profile Summary: 0 successful controls, 2 control failures, 0 controls skipped
Test Summary: 0 successful, 2 failures, 0 skipped
```
