import subprocess
assert(len(simgr.found) > 0)
input = simgr.found[0].posix.dumps(0)
process = subprocess.Popen(
        ["./exercise3"],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
)
output, stderr = process.communicate(input)
assert(b"Congrats, you reached the success function!" in output)
