from datadog_checks.checks import AgentCheck
from datadog_checks.base.utils.subprocess_output import get_subprocess_output

class user_change_detected(AgentCheck):
  def check(self, instance):
    queue, err, retcode = get_subprocess_output(["bash", "/etc/scripts/user_change_detected.sh"], self.log, raise_on_empty_output=True)
    lines = queue.split("\n")
    msg = lines[0].split("Message: ",1)[1].strip()
    stat = lines[1].split("Statistic: ",1)[1].strip()
    self.count('system.security.user_change_detected', stat)
