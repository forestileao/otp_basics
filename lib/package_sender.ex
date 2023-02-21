defmodule PackageSender do
  def get_packages_out do
    packages = ["Book", "Bat", "Apple", "Chair"]

    {:ok, pid} = PackageReceiver.start_link()

    leave_packages_at_door(pid, packages)

    IO.puts("Finished deliveries!")
    IO.puts("--------------------")
  end

  defp leave_packages_at_door(pid, [last_package]) do
    IO.puts("Delivering package #{last_package}")
    PackageReceiver.leave_at_the_door(pid, last_package)
  end

  defp leave_packages_at_door(pid, packages) do
    [package | tail] = packages
    IO.puts("Delivering package #{package}")
    PackageReceiver.leave_at_the_door(pid, package)
    leave_packages_at_door(pid, tail)
  end
end
