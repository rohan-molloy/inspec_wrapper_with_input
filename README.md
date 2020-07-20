# inspec_wrapper_with_input
An InSpec wrapper profile example that child profiles and passes input variables
  
The input `amplifier_max_volume` is passed from the Wrapper to the Child.

The Child input value is:  
```yml
inputs:
- name: amplifier_max_volume
  value: 2
```
  
The Wrapper input value is:  
```yml
depends:
- name: child
  path: ../child
inputs:
- name: amplifier_max_volume
  value: 1400
  profile: child 
```

### Run it
  
Run it from the Wrapper which will execute the child profile.  The `input` is passed in from the Wrapper profile.

```bash
cd wrapper
inspec exec .
```

```bash
Profile: InSpec Profile (wrapper)
Version: 0.1.0
Target:  local://

     No tests executed.

Profile: InSpec Profile (child)
Version: 0.1.0
Target:  local://

  ×  Big Rock Show: 1400
     ×  1400 is expected to cmp == 11

     expected: 11
          got: 1400

     (compared using `cmp` matcher)



Profile Summary: 0 successful controls, 1 control failure, 0 controls skipped
Test Summary: 0 successful, 1 failure, 0 skipped
```
