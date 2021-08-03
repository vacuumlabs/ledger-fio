#include "bip44.h"

#include "securityPolicy.h"

// Helper macros

static inline bool has_fio_prefix_and_any_account(const bip44_path_t* pathSpec)
{
	return bip44_hasValidFIOPrefix(pathSpec) &&
	       bip44_containsAccount(pathSpec);
}

static inline bool is_valid_stake_pool_owner_path(const bip44_path_t* pathSpec)
{
	return bip44_isValidStakingKeyPath(pathSpec);
}

// account is from a small brute-forcable range
static inline bool has_reasonable_account(const bip44_path_t* pathSpec)
{
	return bip44_hasReasonableAccount(pathSpec);
}

// address is from a small brute-forcable range
static inline bool has_reasonable_address(const bip44_path_t* pathSpec)
{
	return bip44_hasReasonableAddress(pathSpec);
}

// both account and address are from a small brute-forcable range
static inline bool has_reasonable_account_and_address(const bip44_path_t* pathSpec)
{
	return has_reasonable_account(pathSpec) && has_reasonable_address(pathSpec);
}

static inline bool is_too_deep(const bip44_path_t* pathSpec)
{
	return bip44_containsMoreThanAddress(pathSpec);
}



#define DENY()                          return POLICY_DENY;
#define DENY_IF(expr)      if (expr)    return POLICY_DENY;
#define DENY_UNLESS(expr)  if (!(expr)) return POLICY_DENY;

#define WARN_IF(expr)      if (expr)    return POLICY_PROMPT_WARN_UNUSUAL;
#define WARN_UNLESS(expr)  if (!(expr)) return POLICY_PROMPT_WARN_UNUSUAL;

#define PROMPT()                        return POLICY_PROMPT_BEFORE_RESPONSE;
#define PROMPT_IF(expr)    if (expr)    return POLICY_PROMPT_BEFORE_RESPONSE;

#define ALLOW()                         return POLICY_ALLOW_WITHOUT_PROMPT;
#define ALLOW_IF(expr)     if (expr)    return POLICY_ALLOW_WITHOUT_PROMPT;

#define SHOW()                          return POLICY_SHOW_BEFORE_RESPONSE;
#define SHOW_IF(expr)      if (expr)    return POLICY_SHOW_BEFORE_RESPONSE;
#define SHOW_UNLESS(expr)  if (!(expr)) return POLICY_SHOW_BEFORE_RESPONSE;


security_policy_t policyForGetPublicKeysInit(size_t numPaths)
{
	PROMPT_IF(numPaths > 1);

	ALLOW();
}

// Get extended public key and return it to the host
security_policy_t policyForGetExtendedPublicKey(const bip44_path_t* pathSpec)
{
	DENY_UNLESS(has_fio_prefix_and_any_account(pathSpec));

	WARN_UNLESS(has_reasonable_account(pathSpec));

	WARN_IF(is_too_deep(pathSpec));

	PROMPT();
}

