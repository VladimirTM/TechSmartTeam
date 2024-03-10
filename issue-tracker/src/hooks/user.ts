import { useQuery } from "@tanstack/react-query";

export const useUser = () => {
  const {
    data: user,
    error,
    isLoading,
  } = useQuery(["user"], () =>
    fetch("/api/users/read/current").then((r) => r.json())
  );

  return { user, error, isLoading };
};
