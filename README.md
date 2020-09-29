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
