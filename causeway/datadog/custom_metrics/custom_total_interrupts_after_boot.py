from datadog_checks.checks import AgentCheck
from datadog_checks.base.utils.subprocess_output import get_subprocess_output

class total_interrupts_after_boot(AgentCheck):
  def check(self, instance):
    queue, err, retcode = get_subprocess_output(["perl", "/etc/scripts/total_interrupts_after_boot.pl"], self.log, raise_on_empty_output=True)
    lines = queue.split("\n")
    total_interrupts_after_boot = queue.split("Statistic: ",1)[1]
    msg = lines[0].split("Message: ",1)[1].strip()
    stat = lines[1].split("Statistic: ",1)[1].strip() 

    self.count('system.cpu.total_interrupts_after_boot', stat)



